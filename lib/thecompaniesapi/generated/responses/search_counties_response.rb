# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchCountiesResponse - API response class
      #
            # 
            #
            class SearchCountiesResponse
              # @return [Array] counties
              attr_reader :counties

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new SearchCountiesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @counties = convert_property(data['counties'], 'counties')
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
