require "goliath"
require "yajl"
require "board-linuxfr/redis_plugin"


class BoardLinuxfr < Goliath::API
  plugin RedisPlugin

  def response(env)
    env.logger.debug "New client: #{env['PATH_INFO']}"
    send_msg = ->(msg) {
      env.logger.debug " -> #{msg}"
      env.stream_send("data: #{msg}\nid: #{msg[:id]}\n\n")
    }
    event_id     = env['HTTP_LAST_EVENT_ID']
    chan_name    = env['PATH_INFO'].delete('/b/')
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
