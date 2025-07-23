# frozen_string_literal: true

require 'faraday'
require 'faraday/net_http'
require 'json'
require 'base64'
require 'cgi'

module TheCompaniesAPI
  class HttpClient
    DEFAULT_API_URL = 'https://api.thecompaniesapi.com'
    DEFAULT_TIMEOUT = 300

    attr_reader :api_token, :api_url, :visitor_id, :connection

    def initialize(api_token: nil, api_url: nil, visitor_id: nil)
      @api_token = api_token
      @api_url = api_url || DEFAULT_API_URL
      @visitor_id = visitor_id
      
      @connection = build_connection
    end

    # HTTP method helpers
    def get(path, params: {})
      handle_response do
        connection.get(path, params)
      end
    end

    def post(path, body: {})
      handle_response do
        connection.post(path, body)
      end
    end

    def put(path, body: {})
      handle_response do
        connection.put(path, body)
      end
    end

    def patch(path, body: {})
      handle_response do
        connection.patch(path, body)
      end
    end

    def delete(path, params: {})
      handle_response do
        connection.delete(path, params)
      end
    end

    private

    def build_connection
      Faraday.new(@api_url) do |conn|
        conn.adapter :net_http
        conn.options[:timeout] = DEFAULT_TIMEOUT
        conn.options[:open_timeout] = 30

        # Add authentication and visitor ID headers
        conn.request :authorization, 'Basic', @api_token if @api_token
        conn.headers['Tca-Visitor-Id'] = @visitor_id if @visitor_id
        conn.headers['User-Agent'] = "thecompaniesapi-ruby/#{TheCompaniesAPI::VERSION}"
        conn.headers['Content-Type'] = 'application/json'

        # Add middleware for request/response handling
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        
        # Custom middleware for query parameter serialization
        conn.use QuerySerializer
      end
    end

    # Custom Faraday middleware for query serialization
    class QuerySerializer < Faraday::Middleware
      def call(env)
        if env.method == :get && env.params && !env.params.empty?
          env.url.query = serialize_params(env.params)
          env.params = {}
        end
        @app.call(env)
      end

      private

      def serialize_params(params)
        search_params = []
        
        params.each do |key, value|
          case value
          when Hash, Array
            # JSON stringify objects and arrays, then URL encode
            encoded_value = CGI.escape(JSON.generate(value))
            search_params << "#{key}=#{encoded_value}"
          when nil
            # Skip nil values
            next
          else
            # Convert to string and URL encode
            encoded_value = CGI.escape(value.to_s)
            search_params << "#{key}=#{encoded_value}"
          end
        end
        
        search_params.join('&')
      end
    end

    def handle_response
      response = yield
      
      case response.status
      when 200..299
        response.body
      when 400..499
        raise TheCompaniesAPI::Error::ClientError.new(
          "Client error: #{response.status}",
          response.status,
          response.body
        )
      when 500..599
        raise TheCompaniesAPI::Error::ServerError.new(
          "Server error: #{response.status}",
          response.status,
          response.body
        )
      else
        raise TheCompaniesAPI::Error::APIError.new(
          "Unexpected response: #{response.status}",
          response.status,
          response.body
        )
      end
    rescue Faraday::TimeoutError => e
      raise TheCompaniesAPI::Error::TimeoutError.new("Request timeout: #{e.message}")
    rescue Faraday::ConnectionFailed => e
      raise TheCompaniesAPI::Error::ConnectionError.new("Connection failed: #{e.message}")
    rescue => e
      raise TheCompaniesAPI::Error::APIError.new("Unexpected error: #{e.message}")
    end
  end
end 
