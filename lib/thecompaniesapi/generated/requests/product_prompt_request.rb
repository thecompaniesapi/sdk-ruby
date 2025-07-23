# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # ProductPromptRequest - API request class
      #
class ProductPromptRequest
              # @return [Float] companyId
              attr_accessor :company_id

              # @return [String] context
              attr_accessor :context

              # @return [String] feature
              attr_accessor :feature

              # @return [Boolean] force
              attr_accessor :force

              # @return [Float] listId
              attr_accessor :list_id

              # @return [String] model
              attr_accessor :model

              # @return [String] prompt
              attr_accessor :prompt

##
# Initialize a new ProductPromptRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @company_id = data['companyId'] || data[:company_id]
                @context = data['context'] || data[:context]
                @feature = data['feature'] || data[:feature]
                @force = data['force'] || data[:force]
                @list_id = data['listId'] || data[:list_id]
                @model = data['model'] || data[:model]
                @prompt = data['prompt'] || data[:prompt]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'companyId' => @company_id,
                  'context' => @context,
                  'feature' => @feature,
                  'force' => @force,
                  'listId' => @list_id,
                  'model' => @model,
                  'prompt' => @prompt,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
