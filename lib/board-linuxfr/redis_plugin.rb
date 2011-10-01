require "hiredis"
require "em-synchrony"
require "redis"
require "redis/connection/synchrony"


class BoardLinuxfr < Goliath::API
  class RedisPlugin
    def initialize(port, config, status, logger)
      logger.info "Initializing the Redis plugin"
      @logger  = logger
      @channel = status[:channel] = EM::Channel.new
      @redis   = Redis.new
    end

    def run
      EM.synchrony do
        @redis.psubscribe("b/*") do |on|
          on.psubscribe do |pattern, total|
            @logger.info "Psubscribe to redis: #{pattern} (#{total})"
          end

          on.pmessage do |pattern, chan, msg|
            _, chan, id, kind = *chan.split('/')
            @channel.push(chan: chan, id: id, kind: kind, msg: msg)
            @logger.info "New message: #{chan} #{id} #{kind} #{msg}"
          end

          on.punsubscribe do |pattern, total|
            @logger.info "Punsubscribe to redis: #{pattern} (#{total})"
          end
        end
      end
    end
  end
end
