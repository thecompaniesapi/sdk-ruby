# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchStatesResponse - API response class
      #
            # 
            #
            class SearchStatesResponse
              # @return [Object] meta
              attr_reader :meta

              # @return [Array] states
              attr_reader :states

##
# Initialize a new SearchStatesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @meta = convert_property(data['meta'], 'meta')
                  @states = convert_property(data['states'], 'states')
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
