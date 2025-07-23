# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchCountriesResponse - API response class
      #
            # 
            #
            class SearchCountriesResponse
              # @return [Array] countries
              attr_reader :countries

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new SearchCountriesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @countries = convert_property(data['countries'], 'countries')
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
