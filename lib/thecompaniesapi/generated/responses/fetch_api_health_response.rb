# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchApiHealthResponse - API response class
      #
            # 
            #
            class FetchApiHealthResponse
              # @return [Boolean] healthy
              attr_reader :healthy

              # @return [String] nodeName
              attr_reader :node_name

              # @return [Hash] report
              attr_reader :report

##
# Initialize a new FetchApiHealthResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @healthy = convert_property(data['healthy'], 'healthy')
                  @node_name = convert_property(data['nodeName'], 'nodeName')
                  @report = convert_property(data['report'], 'report')
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
