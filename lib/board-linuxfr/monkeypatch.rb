# Monkeypatch Goliath to avoid it to crash on invalid parser.
# It's the backport of a commit, waiting for a release. This commit:
# https://github.com/postrank-labs/goliath/commit/79d43b80c9c1345034c6f40a60b1be064e493af3

class Goliath::Request

  # Invoked by connection when header parsing is complete.
  # This method is invoked only once per request.
  #
  # @param h [Hash] Request headers
  # @param parser [Http::Parser] The parser used to parse the request
  # @return [Nil]
  def parse_header(h, parser)
    h.each do |k, v|
      @env[HTTP_PREFIX + k.gsub('-','_').upcase] = v
    end

    %w(CONTENT_TYPE CONTENT_LENGTH).each do |name|
      @env[name] = @env.delete("HTTP_#{name}") if @env["HTTP_#{name}"]
    end

    if @env['HTTP_HOST']
      name, port = @env['HTTP_HOST'].split(':')
      @env[SERVER_NAME] = name if name
      @env[SERVER_PORT] = port if port
    end

    begin
      uri = URI(parser.request_url)

      @env[REQUEST_METHOD] = parser.http_method
      @env[REQUEST_URI] = parser.request_url
      @env[QUERY_STRING] = uri.query
      @env[HTTP_VERSION] = parser.http_version.join('.')
      @env[SCRIPT_NAME] = uri.path
      @env[REQUEST_PATH] = uri.path
      @env[PATH_INFO] = uri.path
      @env[FRAGMENT] = uri.fragment

      yield if block_given?

      @env[ASYNC_HEADERS].call(@env, h) if @env[ASYNC_HEADERS]
    rescue Exception => e
      server_exception(e)
    end
  end

end
