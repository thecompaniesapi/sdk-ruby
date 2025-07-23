# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # ExportCompaniesAnalyticsResponse - API response class
      #
            # 
            #
            class ExportCompaniesAnalyticsResponse
              # @return [Array] data
              attr_reader :data

              # @return [Hash] meta
              attr_reader :meta

##
# Initialize a new ExportCompaniesAnalyticsResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @data = convert_property(data['data'], 'data')
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
