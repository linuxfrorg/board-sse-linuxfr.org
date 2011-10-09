require "hiredis"
require "em-synchrony"
require "redis"
require "redis/connection/synchrony"
require "board-linuxfr/cache"


class BoardLinuxfr
  class RedisPlugin
    def initialize(port, config, status, logger)
      logger.info "Initializing the Redis plugin"
      @logger = logger
      @chans  = status[:channels] = Hash.new { |h,k| h[k] = EM::Channel.new }
      @cache  = status[:cache]    = Cache.new
      @redis  = Redis.new
    end

    def run
      EM.synchrony do
        @redis.psubscribe("b/*") do |on|
          on.psubscribe do |pattern, total|
            @logger.info "Psubscribe to redis: #{pattern} (#{total})"
          end

          on.pmessage do |pattern, chan, msg|
            _, chan, id = *chan.split('/')
            @logger.info "New message: [#{chan.inspect}] #{id}. #{msg}"
            [@chans, @cache].each do |storage|
              storage[chan].push [id, msg]
            end
          end

          on.punsubscribe do |pattern, total|
            @logger.info "Punsubscribe to redis: #{pattern} (#{total})"
          end
        end
      end
    end
  end
end
