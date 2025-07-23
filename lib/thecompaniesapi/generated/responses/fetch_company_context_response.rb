# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchCompanyContextResponse - API response class
      #
            # 
            #
            class FetchCompanyContextResponse
              # @return [Hash] context
              attr_reader :context

              # @return [Hash] meta
              attr_reader :meta

##
# Initialize a new FetchCompanyContextResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @context = convert_property(data['context'], 'context')
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
