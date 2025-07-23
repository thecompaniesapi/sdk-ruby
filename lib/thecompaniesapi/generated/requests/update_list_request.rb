# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # UpdateListRequest - API request class
      #
class UpdateListRequest
              # @return [Boolean] dynamic
              attr_accessor :dynamic

              # @return [Boolean] lastSeen
              attr_accessor :last_seen

              # @return [String] mailFrequency
              attr_accessor :mail_frequency

              # @return [Object] maxCompanies
              attr_accessor :max_companies

              # @return [String] name
              attr_accessor :name

              # @return [Array] query
              attr_accessor :query

              # @return [Boolean] resync
              attr_accessor :resync

##
# Initialize a new UpdateListRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @dynamic = data['dynamic'] || data[:dynamic]
                @last_seen = data['lastSeen'] || data[:last_seen]
                @mail_frequency = data['mailFrequency'] || data[:mail_frequency]
                @max_companies = data['maxCompanies'] || data[:max_companies]
                @name = data['name'] || data[:name]
                @query = data['query'] || data[:query]
                @resync = data['resync'] || data[:resync]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'dynamic' => @dynamic,
                  'lastSeen' => @last_seen,
                  'mailFrequency' => @mail_frequency,
                  'maxCompanies' => @max_companies,
                  'name' => @name,
                  'query' => @query,
                  'resync' => @resync,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
