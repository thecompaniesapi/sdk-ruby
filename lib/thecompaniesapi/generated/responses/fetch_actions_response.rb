# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchActionsResponse - API response class
      #
            # 
            #
            class FetchActionsResponse
              # @return [Array] actions
              attr_reader :actions

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new FetchActionsResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @actions = convert_property(data['actions'], 'actions')
                  @meta = convert_property(data['meta'], 'meta')
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
