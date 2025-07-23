# frozen_string_literal: true

require 'test_helper'

class TheCompaniesAPIClientTest < Minitest::Test
  def test_http_client_creation_with_api_token
    client = TheCompaniesAPI::HttpClient.new(api_token: 'test-api-token')
    
    assert_instance_of TheCompaniesAPI::HttpClient, client
    assert_equal 'test-api-token', client.api_token
    assert_equal 'https://api.thecompaniesapi.com', client.api_url
    assert_nil client.visitor_id
  end

  def test_http_client_creation_with_all_parameters
    client = TheCompaniesAPI::HttpClient.new(
      api_token: 'test-api-token',
      api_url: 'https://test.api.com',
      visitor_id: 'visitor-123'
    )
    
    assert_instance_of TheCompaniesAPI::HttpClient, client
    assert_equal 'test-api-token', client.api_token
    assert_equal 'https://test.api.com', client.api_url
    assert_equal 'visitor-123', client.visitor_id
  end

  def test_client_inheritance
    client = TheCompaniesAPI::Client.new(api_token: 'test-token')
    
    assert_instance_of TheCompaniesAPI::Client, client
    assert_kind_of TheCompaniesAPI::HttpClient, client
    assert_equal 'test-token', client.api_token
  end

  def test_client_defaults
    client = TheCompaniesAPI::Client.new
    
    assert_instance_of TheCompaniesAPI::Client, client
    assert_equal 'https://api.thecompaniesapi.com', client.api_url
    assert_nil client.api_token
    assert_nil client.visitor_id
  end

  def test_connection_configuration
    client = TheCompaniesAPI::HttpClient.new(
      api_token: 'test-token',
      visitor_id: 'visitor-123'
    )
    
    connection = client.connection
    
    assert_equal 'https://api.thecompaniesapi.com/', connection.url_prefix.to_s
    assert_equal 300, connection.options[:timeout]
    assert_equal 30, connection.options[:open_timeout]
  end

  def test_authentication_headers
    client = TheCompaniesAPI::HttpClient.new(api_token: 'test-token')
    headers = client.connection.headers
    
    assert_includes headers.keys, 'User-Agent'
    assert_includes headers.keys, 'Content-Type'
    assert_equal 'application/json', headers['Content-Type']
    assert_match(/thecompaniesapi-ruby/, headers['User-Agent'])
  end

  def test_authentication_headers_with_visitor_id
    client = TheCompaniesAPI::HttpClient.new(
      api_token: 'test-token',
      visitor_id: 'visitor-123'
    )
    headers = client.connection.headers
    
    assert_equal 'visitor-123', headers['Tca-Visitor-Id']
  end

  def test_http_methods_available
    client = TheCompaniesAPI::HttpClient.new(api_token: 'test-token')
    
    assert_respond_to client, :get
    assert_respond_to client, :post
    assert_respond_to client, :put
    assert_respond_to client, :patch
    assert_respond_to client, :delete
  end

  def test_error_classes_hierarchy
    assert_equal StandardError, TheCompaniesAPI::Error.superclass
    assert_equal TheCompaniesAPI::Error, TheCompaniesAPI::Error::ClientError.superclass
    assert_equal TheCompaniesAPI::Error, TheCompaniesAPI::Error::ServerError.superclass
    assert_equal TheCompaniesAPI::Error, TheCompaniesAPI::Error::ConnectionError.superclass
    assert_equal TheCompaniesAPI::Error, TheCompaniesAPI::Error::TimeoutError.superclass
    assert_equal TheCompaniesAPI::Error, TheCompaniesAPI::Error::APIError.superclass
  end

  def test_error_with_status_and_response
    error = TheCompaniesAPI::Error::ClientError.new(
      'Test error', 
      422, 
      { 'validation' => 'failed' }
    )
    
    assert_equal 'Test error', error.message
    assert_equal 422, error.status
    assert_equal({ 'validation' => 'failed' }, error.response_body)
  end

  def test_query_parameter_serialization_simple_values
    middleware = TheCompaniesAPI::HttpClient::QuerySerializer.new(nil)
    
    test_params = {
      'search' => 'microsoft',
      'size' => 10,
      'active' => true,
      'null_value' => nil
    }
    
    result = middleware.send(:serialize_params, test_params)
    
    assert_includes result, 'search=microsoft'
    assert_includes result, 'size=10'
    assert_includes result, 'active=true'
    refute_includes result, 'null_value'
  end

  def test_query_parameter_serialization_arrays_and_objects
    middleware = TheCompaniesAPI::HttpClient::QuerySerializer.new(nil)
    
    test_params = {
      'query' => [
        { attribute: 'about.industries', operator: 'or', sign: 'equals', values: ['software'] }
      ],
      'filters' => { country: 'US', size: '10-50' },
      'sort' => ['name', 'date']
    }
    
    result = middleware.send(:serialize_params, test_params)
    
    # Check that arrays and objects are JSON encoded and URL encoded
    assert_includes result, 'query=' + CGI.escape(JSON.generate(test_params['query']))
    assert_includes result, 'filters=' + CGI.escape(JSON.generate(test_params['filters']))
    assert_includes result, 'sort=' + CGI.escape(JSON.generate(test_params['sort']))
  end

  def test_query_parameter_serialization_edge_cases
    middleware = TheCompaniesAPI::HttpClient::QuerySerializer.new(nil)
    
    test_params = {
      'empty_string' => '',
      'zero' => 0,
      'false_value' => false,
      'empty_array' => [],
      'empty_hash' => {}
    }
    
    result = middleware.send(:serialize_params, test_params)
    
    assert_includes result, 'empty_string='
    assert_includes result, 'zero=0'
    assert_includes result, 'false_value=false'
    assert_includes result, 'empty_array=' + CGI.escape('[]')
    assert_includes result, 'empty_hash=' + CGI.escape('{}')
  end

  def test_query_parameter_serialization_special_characters
    middleware = TheCompaniesAPI::HttpClient::QuerySerializer.new(nil)
    
    test_params = {
      'special' => 'hello world & more',
      'symbols' => '!@#$%^&*()',
      'unicode' => 'café naïve'
    }
    
    result = middleware.send(:serialize_params, test_params)
    
    # Verify proper URL encoding
    assert_includes result, 'special=' + CGI.escape('hello world & more')
    assert_includes result, 'symbols=' + CGI.escape('!@#$%^&*()')
    assert_includes result, 'unicode=' + CGI.escape('café naïve')
  end

  def test_connection_faraday_configuration
    client = TheCompaniesAPI::HttpClient.new(api_token: 'test-token')
    connection = client.connection
    
    # Check that adapter is configured (net_http is used by default)
    refute_nil connection.builder.adapter
    
    # Check middleware stack includes our custom serializer
    middleware_classes = connection.builder.handlers.map(&:klass)
    assert_includes middleware_classes, TheCompaniesAPI::HttpClient::QuerySerializer
  end

  def test_api_url_normalization
    # Test with trailing slash
    client1 = TheCompaniesAPI::HttpClient.new(api_url: 'https://test.api.com/')
    assert_equal 'https://test.api.com/', client1.api_url
    
    # Test without trailing slash
    client2 = TheCompaniesAPI::HttpClient.new(api_url: 'https://test.api.com')
    assert_equal 'https://test.api.com', client2.api_url
  end

  def test_timeout_configuration
    client = TheCompaniesAPI::HttpClient.new
    
    assert_equal 300, client.connection.options[:timeout]
    assert_equal 30, client.connection.options[:open_timeout]
  end

  def test_user_agent_header
    client = TheCompaniesAPI::HttpClient.new
    user_agent = client.connection.headers['User-Agent']
    
    assert_match(/thecompaniesapi-ruby\/#{TheCompaniesAPI::VERSION}/, user_agent)
  end

  def test_json_middleware_configuration
    client = TheCompaniesAPI::HttpClient.new
    
    # Check that JSON request and response middleware are configured
    middleware_classes = client.connection.builder.handlers.map(&:klass)
    assert_includes middleware_classes, Faraday::Request::Json
    assert_includes middleware_classes, Faraday::Response::Json
  end

  # Test error handling would require mocking HTTP responses
  # For now, we test the error class structure and instantiation
  def test_error_instantiation
    errors = [
      TheCompaniesAPI::Error.new('Base error'),
      TheCompaniesAPI::Error::ClientError.new('Client error', 400),
      TheCompaniesAPI::Error::ServerError.new('Server error', 500),
      TheCompaniesAPI::Error::ConnectionError.new('Connection error'),
      TheCompaniesAPI::Error::TimeoutError.new('Timeout error'),
      TheCompaniesAPI::Error::APIError.new('API error')
    ]
    
    errors.each do |error|
      assert_kind_of StandardError, error
      refute_empty error.message
    end
  end

  def test_client_inheritance_preserves_functionality
    client = TheCompaniesAPI::Client.new(
      api_token: 'test-token',
      api_url: 'https://custom.api.com',
      visitor_id: 'visitor-456'
    )
    
    # Verify all HttpClient functionality is inherited
    assert_equal 'test-token', client.api_token
    assert_equal 'https://custom.api.com', client.api_url
    assert_equal 'visitor-456', client.visitor_id
    assert_respond_to client, :get
    assert_respond_to client, :post
    assert_instance_of Faraday::Connection, client.connection
  end
end 
