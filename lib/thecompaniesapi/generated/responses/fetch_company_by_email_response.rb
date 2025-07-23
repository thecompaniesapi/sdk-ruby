# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Responses
      ##
      # FetchCompanyByEmailResponse - API response class
      #
            # 
            #
            class FetchCompanyByEmailResponse
              # @return [Object] company
              attr_reader :company

              # @return [Hash] email
              attr_reader :email

              # @return [Hash] meta
              attr_reader :meta

##
# Initialize a new FetchCompanyByEmailResponse
#
# @param data [Hash] Response data
def initialize(data = {})
                  @company = convert_property(data['company'], 'company')
                  @email = convert_property(data['email'], 'email')
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
