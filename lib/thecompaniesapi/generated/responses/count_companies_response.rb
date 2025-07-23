# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # CountCompaniesResponse - API response class
      #
            # 
            #
            class CountCompaniesResponse
              # @return [Float] count
              attr_reader :count

##
# Initialize a new CountCompaniesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @count = convert_property(data['count'], 'count')
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
