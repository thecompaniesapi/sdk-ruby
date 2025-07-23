# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchTechnologiesResponse - API response class
      #
            # 
            #
            class SearchTechnologiesResponse
              # @return [Object] meta
              attr_reader :meta

              # @return [Array] technologies
              attr_reader :technologies

##
# Initialize a new SearchTechnologiesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @meta = convert_property(data['meta'], 'meta')
                  @technologies = convert_property(data['technologies'], 'technologies')
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
