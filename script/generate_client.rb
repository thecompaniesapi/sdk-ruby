#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'
require 'fileutils'

##
# OpenAPI Client Generator for The Companies API Ruby SDK
# 
# This script fetches the OpenAPI schema and generates operation methods
# that integrate with the existing Client class architecture.
class OpenAPIClientGenerator
  DEFAULT_OPENAPI_URL = 'https://api.thecompaniesapi.com/v2/openapi'
  
  attr_reader :openapi_url, :output_path, :schema

  def initialize(openapi_url = DEFAULT_OPENAPI_URL, output_path = 'lib/thecompaniesapi/generated')
    @openapi_url = openapi_url
    @output_path = output_path
    @schema = nil
  end

  def generate
    puts "🚀 Generating Ruby SDK from OpenAPI schema...\n\n"
    
    # Step 1: Fetch OpenAPI schema
    fetch_schema
    
    # Step 2: Generate operations map
    operations = generate_operations_map
    
    # Step 3: Generate model classes
    generate_models
    
    # Step 4: Generate API request classes
    generate_api_requests(operations)
    
    # Step 5: Generate API response classes
    generate_api_responses(operations)
    
    # Step 6: Generate client methods
    client_methods = generate_client_methods(operations)
    
    # Step 7: Create the generated client class
    create_generated_client(client_methods, operations)
    
    puts "✅ Generation complete!"
    puts "📁 Generated files in: #{@output_path}"
  end

  private

  def fetch_schema
    puts "📥 Fetching OpenAPI schema from #{@openapi_url}..."
    
    uri = URI(@openapi_url)
    
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri)
      request['User-Agent'] = 'TheCompaniesApi-Ruby-SDK-Generator/1.0'
      
      response = http.request(request)
      
      unless response.code == '200'
        raise "Failed to fetch OpenAPI schema: HTTP #{response.code}"
      end
      
      @schema = JSON.parse(response.body)
    end
    
    puts "✅ Schema fetched successfully"
  rescue => e
    raise "Error fetching schema: #{e.message}"
  end

  def generate_operations_map
    puts "🔧 Generating operations map..."
    
    operations = {}
    paths = @schema['paths'] || {}
    
    paths.each do |path, path_data|
      %w[get post put patch delete].each do |method|
        next unless path_data[method]
        
        operation = path_data[method]
        operation_id = operation['operationId']
        
        next unless operation_id
        
        # Extract path parameters
        path_params = path.scan(/\{([^}]+)\}/).flatten
        
        operations[operation_id] = {
          'path' => path,
          'method' => method.upcase,
          'path_params' => path_params,
          'summary' => operation['summary'] || '',
          'description' => operation['description'] || '',
          'parameters' => operation['parameters'] || [],
          'request_body' => operation['requestBody'],
          'responses' => operation['responses'] || {}
        }
      end
    end
    
    puts "✅ Generated #{operations.size} operations"
    operations
  end

  def generate_models
    puts "📋 Generating model classes..."
    
    schemas = @schema.dig('components', 'schemas') || {}
    model_count = 0
    
    ensure_directory("#{@output_path}/models")
    
    schemas.each do |schema_name, schema_data|
      generate_model_class(schema_name, schema_data)
      model_count += 1
    end
    
    puts "✅ Generated #{model_count} model classes"
  end

  def generate_model_class(name, schema)
    class_name = to_pascal_case(name)
    properties = schema['properties'] || {}
    required = schema['required'] || []
    
    class_content = <<~RUBY
      # frozen_string_literal: true

      module TheCompaniesAPI
        module Generated
          module Models
            ##
            # #{class_name} model
            #
    RUBY
    
    if schema['description']
      class_content += "            # #{schema['description']}\n"
    end
    
    class_content += <<~RUBY
            class #{class_name}
    RUBY
    
    # Generate attr_accessors
    properties.each do |prop_name, prop_data|
      class_content += "              # @return [#{get_ruby_type(prop_data)}] #{prop_data['description'] || prop_name}\n"
      class_content += "              attr_accessor :#{to_snake_case(prop_name)}\n\n"
    end
    
    # Generate constructor
    class_content += <<~RUBY
              ##
              # Initialize a new #{class_name}
              #
              # @param data [Hash] Initial data
              def initialize(data = {})
    RUBY
    
    properties.each do |prop_name, prop_data|
      snake_prop = to_snake_case(prop_name)
      ruby_type = get_ruby_type(prop_data)
      
      if ruby_type == 'Time'
        class_content += "                @#{snake_prop} = data['#{prop_name}'] ? Time.parse(data['#{prop_name}'].to_s) : nil\n"
      else
        class_content += "                @#{snake_prop} = data['#{prop_name}']\n"
      end
    end
    
    class_content += <<~RUBY
              end

              ##
              # Convert to hash
              #
              # @return [Hash] Hash representation
              def to_hash
                {
    RUBY
    
    properties.each do |prop_name, prop_data|
      snake_prop = to_snake_case(prop_name)
      ruby_type = get_ruby_type(prop_data)
      
      if ruby_type == 'Time'
        class_content += "                  '#{prop_name}' => @#{snake_prop}&.iso8601,\n"
      else
        class_content += "                  '#{prop_name}' => @#{snake_prop},\n"
      end
    end
    
    class_content += <<~RUBY
                }
              end

              alias_method :to_h, :to_hash
            end
          end
        end
      end
    RUBY
    
    File.write("#{@output_path}/models/#{to_snake_case(class_name)}.rb", class_content)
  end

  def generate_api_requests(operations)
    puts "📤 Generating API request classes..."
    
    request_count = 0
    ensure_directory("#{@output_path}/requests")
    
    operations.each do |operation_id, operation|
      request_body = operation['request_body']
      
      next unless request_body&.dig('content', 'application/json', 'schema')
      
      schema = request_body['content']['application/json']['schema']
      class_name = "#{to_pascal_case(operation_id)}Request"
      
      generate_request_class(class_name, schema, operation_id)
      request_count += 1
    end
    
    puts "✅ Generated #{request_count} API request classes"
  end

  def generate_request_class(class_name, schema, operation_id)
    properties = schema['properties'] || {}
    required = schema['required'] || []
    
    class_content = <<~RUBY
      # frozen_string_literal: true

      module TheCompaniesAPI
        module Generated
          module Requests
            ##
            # #{class_name} - API request class
            #
    RUBY
    
    if schema['description']
      class_content += "            # #{schema['description']}\n            #\n"
    end
    
    class_content += <<~RUBY
            class #{class_name}
    RUBY
    
    # Generate attr_accessors
    properties.each do |prop_name, prop_data|
      snake_prop = to_snake_case(prop_name)
      class_content += "              # @return [#{get_ruby_type(prop_data)}] #{prop_data['description'] || prop_name}\n"
      class_content += "              attr_accessor :#{snake_prop}\n\n"
    end
    
    # Generate constructor
    class_content += <<~RUBY
              ##
              # Initialize a new #{class_name}
              #
              # @param data [Hash] Request data
              def initialize(data = {})
    RUBY
    
    properties.each do |prop_name, prop_data|
      snake_prop = to_snake_case(prop_name)
      ruby_type = get_ruby_type(prop_data)
      
      if ruby_type == 'Time'
        class_content += "                @#{snake_prop} = data['#{prop_name}'] || data[:#{snake_prop}]\n"
        class_content += "                @#{snake_prop} = Time.parse(@#{snake_prop}.to_s) if @#{snake_prop}.is_a?(String)\n"
      else
        class_content += "                @#{snake_prop} = data['#{prop_name}'] || data[:#{snake_prop}]\n"
      end
    end
    
    class_content += <<~RUBY
              end

              ##
              # Convert to hash for API request
              #
              # @return [Hash] Hash representation
              def to_hash
                {
    RUBY
    
    properties.each do |prop_name, prop_data|
      snake_prop = to_snake_case(prop_name)
      ruby_type = get_ruby_type(prop_data)
      
      if ruby_type == 'Time'
        class_content += "                  '#{prop_name}' => @#{snake_prop}&.iso8601,\n"
      else
        class_content += "                  '#{prop_name}' => @#{snake_prop},\n"
      end
    end
    
    class_content += <<~RUBY
                }.compact
              end

              alias_method :to_h, :to_hash
            end
          end
        end
      end
    RUBY
    
    File.write("#{@output_path}/requests/#{to_snake_case(class_name)}.rb", class_content)
  end

  def generate_api_responses(operations)
    puts "📥 Generating API response classes..."
    
    response_count = 0
    ensure_directory("#{@output_path}/responses")
    
    operations.each do |operation_id, operation|
      responses = operation['responses']
      
      # Look for successful responses (200, 201, etc.)
      [200, 201, 202].each do |status_code|
        response = responses[status_code.to_s]
        next unless response&.dig('content', 'application/json', 'schema')
        
        schema = response['content']['application/json']['schema']
        class_name = "#{to_pascal_case(operation_id)}Response"
        
        generate_response_class(class_name, schema, operation)
        response_count += 1
        break # Only generate for the first successful response
      end
    end
    
    puts "✅ Generated #{response_count} API response classes"
  end

  def generate_response_class(class_name, schema, operation)
    class_content = <<~RUBY
      # frozen_string_literal: true

      module TheCompaniesAPI
        module Generated
          module Responses
            ##
            # #{class_name} - API response class
            #
    RUBY
    
    if operation['summary']
      class_content += "            # #{operation['summary']}\n            #\n"
    end
    
    class_content += "            class #{class_name}\n"
    
    if schema['type'] == 'object' && schema['properties']
      # Object response with properties
      properties = schema['properties']
      
      properties.each do |prop_name, prop_data|
        snake_prop = to_snake_case(prop_name)
        class_content += "              # @return [#{get_ruby_type(prop_data)}] #{prop_data['description'] || prop_name}\n"
        class_content += "              attr_reader :#{snake_prop}\n\n"
      end
      
      class_content += <<~RUBY
                ##
                # Initialize a new #{class_name}
                #
                # @param data [Hash] Response data
                def initialize(data = {})
      RUBY
      
      properties.each do |prop_name, prop_data|
        snake_prop = to_snake_case(prop_name)
        class_content += "                  @#{snake_prop} = convert_property(data['#{prop_name}'], '#{prop_name}')\n"
      end
      
      class_content += <<~RUBY
                end

                private

                def convert_property(value, property)
                  case property
      RUBY
      
      # Add specific conversions for typed properties
      properties.each do |prop_name, prop_data|
        ruby_type = get_ruby_type(prop_data)
        if ruby_type.start_with?('TheCompaniesAPI::Generated::Models::')
          class_content += "                  when '#{prop_name}'\n"
          class_content += "                    value.is_a?(Hash) ? #{ruby_type}.new(value) : value\n"
        end
      end
      
      class_content += <<~RUBY
                  else
                    value
                  end
                end
      RUBY
      
    elsif schema['type'] == 'array'
      class_content += <<~RUBY
                # @return [Array] Response data
                attr_reader :data

                ##
                # Initialize a new #{class_name}
                #
                # @param data [Array] Response data
                def initialize(data = [])
                  @data = data
                end
      RUBY
    else
      class_content += <<~RUBY
                # @return [Object] Response data
                attr_reader :data

                ##
                # Initialize a new #{class_name}
                #
                # @param data [Object] Response data
                def initialize(data = nil)
                  @data = data
                end
      RUBY
    end
    
    class_content += "            end\n          end\n        end\n      end\n"
    
    File.write("#{@output_path}/responses/#{to_snake_case(class_name)}.rb", class_content)
  end

  def generate_client_methods(operations)
    puts "🏗️  Generating client methods..."
    
    methods = []
    
    operations.each do |operation_id, operation|
      method_name = to_snake_case(operation_id)
      path = operation['path']
      http_method = operation['method']
      path_params = operation['path_params']
      summary = operation['summary']
      description = operation['description']
      request_body = operation['request_body']
      responses = operation['responses']
      
      # Generate method
      method_content = generate_method(
        method_name, path, http_method, path_params, 
        summary, description, request_body, responses, operation_id
      )
      
      methods << method_content
    end
    
    puts "✅ Generated #{methods.size} client methods"
    methods.join("\n\n")
  end

  def generate_method(method_name, path, http_method, path_params, summary, description, request_body, responses, operation_id)
    # Generate YARD documentation
    doc_lines = ["      ##", "      # #{summary}"]
    doc_lines << "      #" if summary != description && !description.empty?
    doc_lines << "      # #{description}" if !description.empty? && description != summary
    doc_lines << "      #"
    
    # Add path parameters to documentation
    path_params.each do |param|
      doc_lines << "      # @param #{to_snake_case(param)} [String] Path parameter"
    end
    
    if %w[GET DELETE].include?(http_method)
      doc_lines << "      # @param params [Hash] Query parameters"
    else
      doc_lines << "      # @param data [Hash] Request body data"
    end
    
    doc_lines << "      # @param headers [Hash] Additional headers"
    doc_lines << "      # @return [Hash] API response"
    
    # Generate method signature
    signature_params = []
    path_params.each { |param| signature_params << "#{to_snake_case(param)}" }
    
    if %w[GET DELETE].include?(http_method)
      signature_params << "params: {}"
    else
      signature_params << "data: {}"
    end
    
    signature_params << "headers: {}"
    signature = "def #{method_name}(#{signature_params.join(', ')})"
    
    # Generate method body
    body_lines = []
    
    # Build endpoint path with parameter substitution
    if path_params.any?
      path_expression = path.dup
      path_params.each do |param|
        snake_param = to_snake_case(param)
        path_expression = path_expression.gsub("{#{param}}", "\#{#{snake_param}}")
      end
      body_lines << "        endpoint = \"#{path_expression}\""
    else
      body_lines << "        endpoint = '#{path}'"
    end
    
    body_lines << ""
    
    # Make the HTTP request
    if %w[GET DELETE].include?(http_method)
      body_lines << "        #{http_method.downcase}(endpoint, params: params)"
    else
      body_lines << "        #{http_method.downcase}(endpoint, body: data)"
    end
    
    # Combine everything
    [
      doc_lines.join("\n"),
      "      #{signature}",
      body_lines.map { |line| "      #{line}" }.join("\n"),
      "      end"
    ].join("\n")
  end

  def create_generated_client(methods, operations)
    puts "🏗️  Creating generated client class..."
    
    # Generate the main Client class with all API methods
    class_content = <<~RUBY
      # frozen_string_literal: true

      require_relative 'http_client'

      module TheCompaniesAPI
        ##
        # The Companies API client with auto-generated methods
        #
        # This class extends HttpClient with auto-generated methods
        # from the OpenAPI specification.
        class Client < HttpClient
      #{methods}
        end
      end
    RUBY
    
    # Write to the main client file, not the generated subdirectory
    File.write("#{File.dirname(@output_path)}/client.rb", class_content)
    
    # Create operations map in the generated directory for reference
    operations_content = <<~RUBY
      # frozen_string_literal: true

      module TheCompaniesAPI
        module Generated
          ##
          # Operations map auto-generated from OpenAPI schema
          module OperationsMap
            OPERATIONS = #{operations.inspect}
          end
        end
      end
    RUBY
    
    File.write("#{@output_path}/operations_map.rb", operations_content)
  end

  # Helper methods
  def to_snake_case(string)
    string
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .downcase
  end

  def to_pascal_case(string)
    # Handle camelCase, snake_case, and kebab-case
    string
      .gsub(/([a-z])([A-Z])/, '\1_\2')  # Insert underscore between camelCase
      .split(/[-_]/)                    # Split on hyphens and underscores
      .map(&:capitalize)                # Capitalize each word
      .join                             # Join without separators
  end

  def get_ruby_type(property)
    type = property['type']
    format = property['format']
    
    return 'Object' unless type
    
    case type
    when 'string'
      case format
      when 'date', 'date-time'
        'Time'
      else
        'String'
      end
    when 'integer'
      'Integer'
    when 'number'
      'Float'
    when 'boolean'
      'Boolean'
    when 'array'
      'Array'
    when 'object'
      'Hash'
    else
      'Object'
    end
  end

  def ensure_directory(path)
    FileUtils.mkdir_p(path) unless Dir.exist?(path)
  end
end

# CLI Usage
if ARGV.empty?
  puts "Usage: ruby generate_client.rb [openapi-url] [output-dir]"
  puts "Example: ruby generate_client.rb https://api.thecompaniesapi.com/v2/openapi lib/thecompaniesapi/generated"
  exit 1
end

openapi_url = ARGV[0] || OpenAPIClientGenerator::DEFAULT_OPENAPI_URL
output_dir = ARGV[1] || 'lib/thecompaniesapi/generated'

begin
  generator = OpenAPIClientGenerator.new(openapi_url, output_dir)
  generator.generate
rescue => e
  puts "❌ Error: #{e.message}"
  puts e.backtrace.join("\n") if ENV['DEBUG']
  exit 1
end 
