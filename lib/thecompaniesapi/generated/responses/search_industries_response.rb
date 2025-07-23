# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchIndustriesResponse - API response class
      #
            # 
            #
            class SearchIndustriesResponse
              # @return [Array] industries
              attr_reader :industries

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new SearchIndustriesResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @industries = convert_property(data['industries'], 'industries')
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
