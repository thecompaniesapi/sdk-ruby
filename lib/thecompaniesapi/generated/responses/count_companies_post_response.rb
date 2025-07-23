# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # CountCompaniesPostResponse - API response class
      #
            # 
            #
            class CountCompaniesPostResponse
              # @return [Float] count
              attr_reader :count

##
# Initialize a new CountCompaniesPostResponse
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
