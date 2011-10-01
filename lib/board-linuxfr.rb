require "goliath"
require "yajl"
require "board-linuxfr/redis_plugin"


class BoardLinuxfr < Goliath::API
  plugin RedisPlugin

  def initialize
    Redis.new
  end

  def response(env)
    env.logger.debug "New client"
    env['subscription'] = status[:channel].subscribe do |msg|
      env.stream_send("data: #{msg}\n\n")
    end
    streaming_response(200, {'Content-Type' => 'text/event-stream'})
  end

  def on_close
    return unless env['subscription']
    status[:channel].unsubscribe(env['subscription'])
  end
end
