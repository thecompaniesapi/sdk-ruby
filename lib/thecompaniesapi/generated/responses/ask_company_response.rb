# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # AskCompanyResponse - API response class
      #
            # 
            #
            class AskCompanyResponse
              # @return [Hash] meta
              attr_reader :meta

              # @return [Object] A natural language request made to the platform resolving to a specific action or search segment.
              attr_reader :prompt

##
# Initialize a new AskCompanyResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @meta = convert_property(data['meta'], 'meta')
                  @prompt = convert_property(data['prompt'], 'prompt')
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
