# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # RequestActionRequest - API request class
      #
class RequestActionRequest
              # @return [Array] domains
              attr_accessor :domains

              # @return [Boolean] estimate
              attr_accessor :estimate

              # @return [Array] fields
              attr_accessor :fields

              # @return [String] job
              attr_accessor :job

              # @return [Float] listId
              attr_accessor :list_id

              # @return [Array] names
              attr_accessor :names

              # @return [Float] promptId
              attr_accessor :prompt_id

              # @return [Array] query
              attr_accessor :query

              # @return [String] question
              attr_accessor :question

              # @return [String] type
              attr_accessor :type

##
# Initialize a new RequestActionRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @domains = data['domains'] || data[:domains]
                @estimate = data['estimate'] || data[:estimate]
                @fields = data['fields'] || data[:fields]
                @job = data['job'] || data[:job]
                @list_id = data['listId'] || data[:list_id]
                @names = data['names'] || data[:names]
                @prompt_id = data['promptId'] || data[:prompt_id]
                @query = data['query'] || data[:query]
                @question = data['question'] || data[:question]
                @type = data['type'] || data[:type]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'domains' => @domains,
                  'estimate' => @estimate,
                  'fields' => @fields,
                  'job' => @job,
                  'listId' => @list_id,
                  'names' => @names,
                  'promptId' => @prompt_id,
                  'query' => @query,
                  'question' => @question,
                  'type' => @type,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
