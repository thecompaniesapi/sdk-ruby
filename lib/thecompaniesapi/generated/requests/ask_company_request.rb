# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # AskCompanyRequest - API request class
      #
class AskCompanyRequest
              # @return [Boolean] explain
              attr_accessor :explain

              # @return [Array] fields
              attr_accessor :fields

              # @return [Float] listId
              attr_accessor :list_id

              # @return [String] model
              attr_accessor :model

              # @return [Array] query
              attr_accessor :query

              # @return [String] question
              attr_accessor :question

##
# Initialize a new AskCompanyRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @explain = data['explain'] || data[:explain]
                @fields = data['fields'] || data[:fields]
                @list_id = data['listId'] || data[:list_id]
                @model = data['model'] || data[:model]
                @query = data['query'] || data[:query]
                @question = data['question'] || data[:question]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'explain' => @explain,
                  'fields' => @fields,
                  'listId' => @list_id,
                  'model' => @model,
                  'query' => @query,
                  'question' => @question,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
