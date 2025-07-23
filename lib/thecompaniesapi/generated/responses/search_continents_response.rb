# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchContinentsResponse - API response class
      #
            # 
            #
            class SearchContinentsResponse
              # @return [Array] continents
              attr_reader :continents

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new SearchContinentsResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @continents = convert_property(data['continents'], 'continents')
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
