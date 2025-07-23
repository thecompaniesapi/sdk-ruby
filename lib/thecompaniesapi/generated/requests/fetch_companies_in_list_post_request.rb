# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # FetchCompaniesInListPostRequest - API request class
      #
class FetchCompaniesInListPostRequest
              # @return [Float] actionId
              attr_accessor :action_id

              # @return [Float] page
              attr_accessor :page

              # @return [Array] query
              attr_accessor :query

              # @return [Boolean] simplified
              attr_accessor :simplified

              # @return [Float] size
              attr_accessor :size

              # @return [Array] sortFields
              attr_accessor :sort_fields

              # @return [String] sortKey
              attr_accessor :sort_key

              # @return [String] sortOrder
              attr_accessor :sort_order

##
# Initialize a new FetchCompaniesInListPostRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @action_id = data['actionId'] || data[:action_id]
                @page = data['page'] || data[:page]
                @query = data['query'] || data[:query]
                @simplified = data['simplified'] || data[:simplified]
                @size = data['size'] || data[:size]
                @sort_fields = data['sortFields'] || data[:sort_fields]
                @sort_key = data['sortKey'] || data[:sort_key]
                @sort_order = data['sortOrder'] || data[:sort_order]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'actionId' => @action_id,
                  'page' => @page,
                  'query' => @query,
                  'simplified' => @simplified,
                  'size' => @size,
                  'sortFields' => @sort_fields,
                  'sortKey' => @sort_key,
                  'sortOrder' => @sort_order,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
