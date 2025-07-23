# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # ToggleCompaniesInListRequest - API request class
      #
class ToggleCompaniesInListRequest
              # @return [String] action
              attr_accessor :action

              # @return [Array] companyIds
              attr_accessor :company_ids

              # @return [Array] domains
              attr_accessor :domains

              # @return [Boolean] refresh
              attr_accessor :refresh

##
# Initialize a new ToggleCompaniesInListRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @action = data['action'] || data[:action]
                @company_ids = data['companyIds'] || data[:company_ids]
                @domains = data['domains'] || data[:domains]
                @refresh = data['refresh'] || data[:refresh]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'action' => @action,
                  'companyIds' => @company_ids,
                  'domains' => @domains,
                  'refresh' => @refresh,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
