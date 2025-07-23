# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # ProductPromptResponse - API response class
      #
            # 
            #
            class ProductPromptResponse
              # @return [Object] meta
              attr_reader :meta

              # @return [Object] prompt
              attr_reader :prompt

              # @return [Object] response
              attr_reader :response

##
# Initialize a new ProductPromptResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @meta = convert_property(data['meta'], 'meta')
                  @prompt = convert_property(data['prompt'], 'prompt')
                  @response = convert_property(data['response'], 'response')
end

private

def convert_property(value, property)
  case property
  else
    value
  end
end
            end
          end
        end
      end
