# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # ExportCompaniesAnalyticsRequest - API request class
      #
class ExportCompaniesAnalyticsRequest
              # @return [Float] actionId
              attr_accessor :action_id

              # @return [Array] attributes
              attr_accessor :attributes

              # @return [String] format
              attr_accessor :format

              # @return [Boolean] full
              attr_accessor :full

              # @return [Float] listId
              attr_accessor :list_id

              # @return [Array] query
              attr_accessor :query

              # @return [Float] size
              attr_accessor :size

              # @return [String] sort
              attr_accessor :sort

##
# Initialize a new ExportCompaniesAnalyticsRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @action_id = data['actionId'] || data[:action_id]
                @attributes = data['attributes'] || data[:attributes]
                @format = data['format'] || data[:format]
                @full = data['full'] || data[:full]
                @list_id = data['listId'] || data[:list_id]
                @query = data['query'] || data[:query]
                @size = data['size'] || data[:size]
                @sort = data['sort'] || data[:sort]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'actionId' => @action_id,
                  'attributes' => @attributes,
                  'format' => @format,
                  'full' => @full,
                  'listId' => @list_id,
                  'query' => @query,
                  'size' => @size,
                  'sort' => @sort,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
