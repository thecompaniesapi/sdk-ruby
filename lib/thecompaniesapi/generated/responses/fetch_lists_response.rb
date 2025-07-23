# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchListsResponse - API response class
      #
            # 
            #
            class FetchListsResponse
              # @return [Array] lists
              attr_reader :lists

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new FetchListsResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @lists = convert_property(data['lists'], 'lists')
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
