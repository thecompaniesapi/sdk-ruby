# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # UpdateTeamRequest - API request class
      #
class UpdateTeamRequest
              # @return [String] country
              attr_accessor :country

              # @return [String] name
              attr_accessor :name

              # @return [String] websiteUrl
              attr_accessor :website_url

##
# Initialize a new UpdateTeamRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @country = data['country'] || data[:country]
                @name = data['name'] || data[:name]
                @website_url = data['websiteUrl'] || data[:website_url]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'country' => @country,
                  'name' => @name,
                  'websiteUrl' => @website_url,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
