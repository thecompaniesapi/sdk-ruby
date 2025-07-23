# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # SearchCompaniesByPromptResponse - API response class
      #
            # 
            #
            class SearchCompaniesByPromptResponse
              # @return [Array] companies
              attr_reader :companies

              # @return [Object] meta
              attr_reader :meta

##
# Initialize a new SearchCompaniesByPromptResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @companies = convert_property(data['companies'], 'companies')
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
