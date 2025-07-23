# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchPromptsResponse - API response class
      #
            # 
            #
            class FetchPromptsResponse
              # @return [Object] meta
              attr_reader :meta

              # @return [Array] prompts
              attr_reader :prompts

##
# Initialize a new FetchPromptsResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @meta = convert_property(data['meta'], 'meta')
                  @prompts = convert_property(data['prompts'], 'prompts')
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
