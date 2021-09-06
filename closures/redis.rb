module Redis
  class Server
    # ... more code

    def run
      loop do
        session = @server.accept
        begin
          return if yield(session) == :exit
        ensure
          session.close
        end
      end
    rescue StandardError => e
      warn "Error running server: #{e.message}"
      warn e.backtrace
    ensure
      @server.close
    end

    # more code...
  end
end

redis_server = Redis::Server.new
redis_server.run do |session|
  # do something with session
  # Return a symbol like :exit
end
