# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # RetryActionResponse - API response class
      #
            # 
            #
            class RetryActionResponse
              # @return [Object] action
              attr_reader :action

##
# Initialize a new RetryActionResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @action = convert_property(data['action'], 'action')
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
