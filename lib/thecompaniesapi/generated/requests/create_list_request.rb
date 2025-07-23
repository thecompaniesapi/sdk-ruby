# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # CreateListRequest - API request class
      #
class CreateListRequest
              # @return [Boolean] dynamic
              attr_accessor :dynamic

              # @return [Boolean] imported
              attr_accessor :imported

              # @return [String] mailFrequency
              attr_accessor :mail_frequency

              # @return [Float] maxCompanies
              attr_accessor :max_companies

              # @return [String] name
              attr_accessor :name

              # @return [Boolean] processInitialized
              attr_accessor :process_initialized

              # @return [Array] query
              attr_accessor :query

              # @return [Array] similarDomains
              attr_accessor :similar_domains

##
# Initialize a new CreateListRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @dynamic = data['dynamic'] || data[:dynamic]
                @imported = data['imported'] || data[:imported]
                @mail_frequency = data['mailFrequency'] || data[:mail_frequency]
                @max_companies = data['maxCompanies'] || data[:max_companies]
                @name = data['name'] || data[:name]
                @process_initialized = data['processInitialized'] || data[:process_initialized]
                @query = data['query'] || data[:query]
                @similar_domains = data['similarDomains'] || data[:similar_domains]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'dynamic' => @dynamic,
                  'imported' => @imported,
                  'mailFrequency' => @mail_frequency,
                  'maxCompanies' => @max_companies,
                  'name' => @name,
                  'processInitialized' => @process_initialized,
                  'query' => @query,
                  'similarDomains' => @similar_domains,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
