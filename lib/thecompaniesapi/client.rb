# frozen_string_literal: true

require_relative 'http_client'

module TheCompaniesAPI
  class Client < HttpClient
    # The main client class that extends HttpClient
    # API operations will be added here in the next step
    
    def initialize(api_token: nil, api_url: nil, visitor_id: nil)
      super(api_token: api_token, api_url: api_url, visitor_id: visitor_id)
    end
  end
end
