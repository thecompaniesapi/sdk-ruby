# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # PromptToSegmentationResponse - API response class
      #
            # 
            #
            class PromptToSegmentationResponse
              # @return [Object] meta
              attr_reader :meta

              # @return [Object] prompt
              attr_reader :prompt

              # @return [Hash] response
              attr_reader :response

##
# Initialize a new PromptToSegmentationResponse
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
