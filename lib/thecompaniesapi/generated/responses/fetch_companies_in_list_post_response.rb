# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchCompaniesInListPostResponse - API response class
      #
            # 
            #
            class FetchCompaniesInListPostResponse
              # @return [Array] companies
              attr_reader :companies

              # @return [Object] meta
              attr_reader :meta

              # @return [Array] query
              attr_reader :query

##
# Initialize a new FetchCompaniesInListPostResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @companies = convert_property(data['companies'], 'companies')
                  @meta = convert_property(data['meta'], 'meta')
                  @query = convert_property(data['query'], 'query')
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
