# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # PromptToSegmentationRequest - API request class
      #
class PromptToSegmentationRequest
              # @return [String] context
              attr_accessor :context

              # @return [Boolean] force
              attr_accessor :force

              # @return [Float] listId
              attr_accessor :list_id

              # @return [String] model
              attr_accessor :model

              # @return [String] prompt
              attr_accessor :prompt

##
# Initialize a new PromptToSegmentationRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @context = data['context'] || data[:context]
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
                  'context' => @context,
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
