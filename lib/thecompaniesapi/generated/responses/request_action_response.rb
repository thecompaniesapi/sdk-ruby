# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # RequestActionResponse - API response class
      #
            # 
            #
            class RequestActionResponse
              # @return [Array] actions
              attr_reader :actions

##
# Initialize a new RequestActionResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @actions = convert_property(data['actions'], 'actions')
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
