# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # Prompt model
      #
            # A natural language request made to the platform resolving to a specific action or search segment.
class Prompt
              # @return [Float] companyId
              attr_accessor :company_id

              # @return [String] context
              attr_accessor :context

              # @return [String] createdAt
              attr_accessor :created_at

              # @return [Hash] data
              attr_accessor :data

              # @return [String] feature
              attr_accessor :feature

              # @return [Float] hits
              attr_accessor :hits

              # @return [Float] id
              attr_accessor :id

              # @return [String] model
              attr_accessor :model

              # @return [String] prompt
              attr_accessor :prompt

              # @return [String] promptKey
              attr_accessor :prompt_key

              # @return [Object] response
              attr_accessor :response

              # @return [String] updatedAt
              attr_accessor :updated_at

##
# Initialize a new Prompt
#
# @param data [Hash] Initial data
def initialize(data = {})
                @company_id = data['companyId']
                @context = data['context']
                @created_at = data['createdAt']
                @data = data['data']
                @feature = data['feature']
                @hits = data['hits']
                @id = data['id']
                @model = data['model']
                @prompt = data['prompt']
                @prompt_key = data['promptKey']
                @response = data['response']
                @updated_at = data['updatedAt']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'companyId' => @company_id,
                  'context' => @context,
                  'createdAt' => @created_at,
                  'data' => @data,
                  'feature' => @feature,
                  'hits' => @hits,
                  'id' => @id,
                  'model' => @model,
                  'prompt' => @prompt,
                  'promptKey' => @prompt_key,
                  'response' => @response,
                  'updatedAt' => @updated_at,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
