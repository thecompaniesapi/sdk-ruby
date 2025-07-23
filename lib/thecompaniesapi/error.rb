module TheCompaniesAPI
  class Error < StandardError
    attr_reader :status, :response_body

    def initialize(message = nil, status = nil, response_body = nil)
      super(message)
      @status = status
      @response_body = response_body
    end
  end

  class Error
    # Client errors (4xx)
    class ClientError < Error; end
    
    # Server errors (5xx)  
    class ServerError < Error; end
    
    # Network/connection errors
    class ConnectionError < Error; end
    
    # Timeout errors
    class TimeoutError < Error; end
    
    # Generic API errors
    class APIError < Error; end
  end
end
