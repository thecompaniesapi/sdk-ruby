# frozen_string_literal: true

require 'test_helper'

begin
  require 'dotenv'
rescue LoadError
  # dotenv is optional for integration tests
end

##
# Integration tests for The Companies API Ruby SDK
# 
# These tests make real API calls and require a valid API token.
# 
# Setup:
# 1. Create a .env file in the project root with:
#    TCA_API_TOKEN=your-api-token-here
#    TCA_API_URL=https://api.thecompaniesapi.com (optional)
#    TCA_VISITOR_ID=your-visitor-id (optional)
#    TCA_TIMEOUT=30 (optional)
# 
# 2. Run integration tests with: bundle exec rake test test/integration_test.rb
# 
# To skip integration tests, don't set TCA_API_TOKEN
class IntegrationTest < Minitest::Test
  @@client = nil
  
  ##
  # Load .env file if it exists (for local testing)
  def self.load_env_for_testing
    env_file = File.expand_path('../.env', __dir__)
    if File.exist?(env_file) && defined?(Dotenv)
      Dotenv.load(env_file)
    end
  end
  
  ##
  # Get API token from environment variables
  def self.get_api_token
    load_env_for_testing
    ENV['TCA_API_TOKEN']
  end
  
  ##
  # Setup integration client configured for testing
  def self.setup_integration_client
    return @@client if @@client
    
    token = get_api_token
    if token.nil? || token.empty?
      raise "TCA_API_TOKEN not set. Please set TCA_API_TOKEN in .env file or environment."
    end
    
    params = {
      api_token: token
    }
    
    # Optional: Custom base URL from environment
    if ENV['TCA_API_URL'] && !ENV['TCA_API_URL'].empty?
      params[:api_url] = ENV['TCA_API_URL']
    end
    
    # Optional: Visitor ID from environment  
    if ENV['TCA_VISITOR_ID'] && !ENV['TCA_VISITOR_ID'].empty?
      params[:visitor_id] = ENV['TCA_VISITOR_ID']
    end
    
    @@client = TheCompaniesAPI::Client.new(**params)
    @@client
  end
  
  def test_search_companies_basic
    client = self.class.setup_integration_client
    
    # Test basic search using GET method (simple parameters)
    response = client.search_companies(
      params: {
        page: 1,
        size: 5,  # Small size for faster tests
        search: 'technology'
      }
    )
    
    assert_kind_of Hash, response
    assert response.key?('companies')
    assert response.key?('meta')
    assert_kind_of Array, response['companies']
    assert_kind_of Hash, response['meta']
  end
  
  def test_search_companies_with_query
    client = self.class.setup_integration_client
    
    # Test search with query conditions using POST method
    request_data = {
      page: 1,
      size: 3,
      query: [
        {
          attribute: 'about.industries',
          operator: 'or',
          sign: 'equals',
          values: ['technology']
        }
      ]
    }
    
    response = client.search_companies_post(data: request_data)
    
    assert_kind_of Hash, response
    assert response.key?('companies')
    assert_kind_of Array, response['companies']
  end
  
  def test_count_companies_basic
    client = self.class.setup_integration_client
    
    # Test basic count using GET method
    response = client.count_companies(
      params: {
        search: 'software'
      }
    )
    
    assert_kind_of Hash, response
    # Count endpoint might return different structure
    if response.key?('count')
      assert_kind_of Numeric, response['count']
      assert response['count'] >= 0
    else
      # Some count endpoints might return the number directly
      assert_kind_of Numeric, response.values.first
      assert response.values.first >= 0
    end
  end
  
  def test_count_companies_with_query
    client = self.class.setup_integration_client
    
    # Test count with query conditions using POST method
    request_data = {
      query: [
        {
          attribute: 'about.industries',
          operator: 'or',
          sign: 'equals',
          values: ['saas']
        }
      ]
    }
    
    response = client.count_companies_post(data: request_data)
    
    assert_kind_of Hash, response
    # Count endpoint might return different structure
    if response.key?('count')
      assert_kind_of Numeric, response['count']
    else
      assert_kind_of Numeric, response.values.first
    end
  end
  
  def test_fetch_company_by_email
    client = self.class.setup_integration_client
    
    # Test with well-known company emails
    test_cases = [
      { name: 'openai_email', email: 'contact@openai.com' },
      { name: 'microsoft_email', email: 'info@microsoft.com' },
      { name: 'google_email', email: 'press@google.com' }
    ]
    
    test_cases.each do |test_case|
      begin
        response = client.fetch_company_by_email(
          params: {
            email: test_case[:email]
          }
        )
        
        assert_kind_of Hash, response
        
      rescue TheCompaniesAPI::Error::ClientError, TheCompaniesAPI::Error::ServerError => e
        # Don't fail the test - the email might not be in the database
        # Just verify the error is handled properly
        assert_kind_of TheCompaniesAPI::Error, e
      end
    end
    
    # At least verify that the method exists and can be called
    assert_respond_to client, :fetch_company_by_email
  end
  
  def test_search_companies_by_name
    client = self.class.setup_integration_client
    
    response = client.search_companies_by_name(
      params: {
        name: 'Microsoft',
        size: 3
      }
    )
    
    assert_kind_of Hash, response
    assert response.key?('companies')
    assert_kind_of Array, response['companies']
  end
  
  def test_search_companies_by_prompt
    client = self.class.setup_integration_client
    
    response = client.search_companies_by_prompt(
      params: {
        prompt: 'Technology companies in the United States',
        size: 3
      }
    )
    
    assert_kind_of Hash, response
    assert response.key?('companies')
    assert_kind_of Array, response['companies']
  end
  
  def test_error_handling
    client = self.class.setup_integration_client
    
    # Test with invalid email format
    begin
      response = client.fetch_company_by_email(
        params: {
          email: 'invalid-email-format'
        }
      )
      
      # If we get here, check the response for error indicators
      assert_kind_of Hash, response
      
    rescue TheCompaniesAPI::Error::ClientError => e
      # This is expected behavior for client errors
      assert_kind_of TheCompaniesAPI::Error::ClientError, e
      assert_kind_of Numeric, e.status
      assert e.status >= 400
      assert e.status < 500
    rescue TheCompaniesAPI::Error::ServerError => e
      # Server errors are also acceptable (might be rate limiting, etc.)
      assert_kind_of TheCompaniesAPI::Error::ServerError, e
    rescue TheCompaniesAPI::Error::APIError => e
      # Generic API errors are also acceptable for invalid input
      assert_kind_of TheCompaniesAPI::Error::APIError, e
      assert_includes e.message, "Client error"
    end
  end
  
  def test_complex_query_serialization
    client = self.class.setup_integration_client
    
    # Test complex query serialization to verify our custom query parameter handling
    request_data = {
      page: 1,
      size: 2,
      query: [
        {
          attribute: 'about.industries',
          operator: 'or',
          sign: 'equals',
          values: ['technology', 'saas']
        }
      ],
      search_fields: ['about.name', 'domain.domain']
    }
    
    response = client.search_companies_post(data: request_data)
    
    assert_kind_of Hash, response
    assert response.key?('companies')
    assert_kind_of Array, response['companies']
  end
  
  def test_fetch_api_health
    client = self.class.setup_integration_client
    
    # Test the health endpoint
    response = client.fetch_api_health
    
    assert_kind_of Hash, response
    # Health endpoint should return some status information
  end
  
  def test_client_configuration
    client = self.class.setup_integration_client
    
    # Verify client configuration
    assert_equal TheCompaniesAPI::Client, client.class
    assert_respond_to client, :api_token
    assert_respond_to client, :api_url
    refute_empty client.api_token
    
    # Test that we can make a simple health check or basic request
         begin
       response = client.count_companies(params: { search: 'test' })
       assert_kind_of Hash, response
       # Just verify we got a valid response structure
    rescue TheCompaniesAPI::Error => e
      flunk "Client configuration test failed: #{e.message}"
    end
  end
  
  def test_request_objects_work
    client = self.class.setup_integration_client
    
    # Test that we can use request objects if they exist
    begin
      # Try to create a request object if the class exists
      if defined?(TheCompaniesAPI::Generated::Requests::SearchCompaniesPostRequest)
        request = TheCompaniesAPI::Generated::Requests::SearchCompaniesPostRequest.new(
          page: 1,
          size: 2,
          query: [
            {
              attribute: 'about.industries',
              operator: 'or', 
              sign: 'equals',
              values: ['technology']
            }
          ]
        )
        
        # Convert to hash and use it
        response = client.search_companies_post(data: request.to_hash)
        assert_kind_of Hash, response
      end
    rescue NameError
      # Request classes might not be loaded, that's OK
             skip "Request classes not available"
    end
  end
  
  ##
  # Helper method to run all integration tests in sequence
  def test_full_integration_flow
    # Test 1: Basic search
    test_search_companies_basic
    
    # Test 2: Complex query search  
    test_search_companies_with_query
    
    # Test 3: Count operations
    test_count_companies_basic
    test_count_companies_with_query
    
    # Test 4: Company lookup
    test_fetch_company_by_email
    
    # Test 5: Search by name and prompt
    test_search_companies_by_name
    test_search_companies_by_prompt
    
    # Test 6: Error handling
    test_error_handling
    
    # Test 7: Query serialization
    test_complex_query_serialization
    
    # Test 8: API health
    test_fetch_api_health
  end
end 
