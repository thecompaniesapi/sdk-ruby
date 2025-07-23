# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # CountCompaniesPostRequest - API request class
      #
class CountCompaniesPostRequest
              # @return [Float] actionId
              attr_accessor :action_id

              # @return [Array] query
              attr_accessor :query

              # @return [String] search
              attr_accessor :search

              # @return [Array] searchFields
              attr_accessor :search_fields

##
# Initialize a new CountCompaniesPostRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @action_id = data['actionId'] || data[:action_id]
                @query = data['query'] || data[:query]
                @search = data['search'] || data[:search]
                @search_fields = data['searchFields'] || data[:search_fields]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'actionId' => @action_id,
                  'query' => @query,
                  'search' => @search,
                  'searchFields' => @search_fields,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
