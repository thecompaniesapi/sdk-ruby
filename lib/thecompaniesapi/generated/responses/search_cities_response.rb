# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchCitiesResponse - API response class
      #
            # 
            #
            class SearchCitiesResponse
              # @return [Array] cities
              attr_reader :cities

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new SearchCitiesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @cities = convert_property(data['cities'], 'cities')
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
