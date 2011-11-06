require "goliath"
require "yajl"


class BoardLinuxfr < Goliath::API
  autoload :Cache,       "board-linuxfr/cache"
  autoload :RedisPlugin, "board-linuxfr/redis_plugin"
  autoload :VERSION,     "board-linuxfr/version"

  plugin RedisPlugin

  def response(env)
    env.logger.info "New client: #{env['PATH_INFO']}"
    send_msg  = ->(args) {
      id, msg = *args
      env.logger.debug " -> #{id}. #{msg}"
      env.stream_send("data: #{args.last}\nid: #{args.first}\n\n")
      env.stream_close if env['HTTP_X_REQUESTED_WITH']
    }
    event_id  = env['HTTP_LAST_EVENT_ID']
    chan_name = env['PATH_INFO'].split('/', 3).last
    env['cache'] = status[:cache][chan_name]
    env['chan']  = status[:channels][chan_name]
    env['sid']   = env['chan'].subscribe &send_msg
    env['timer'] = EM.add_periodic_timer(15) { env.stream_send "::\n\n" }
    EM.next_tick { env['cache'].from(event_id, &send_msg) } if event_id
    streaming_response(200, {'Content-Type' => 'text/event-stream'})
  end

  def on_close(env)
    env['chan'].unsubscribe env['sid'] if env['sid']
    env['timer'].cancel                if env['timer']
  end
end
