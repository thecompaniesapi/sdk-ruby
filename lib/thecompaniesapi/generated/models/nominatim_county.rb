# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # NominatimCounty model
      #
            # A county from the Nominatim API.
class NominatimCounty
              # @return [Object] citiesCount
              attr_accessor :cities_count

              # @return [String] code
              attr_accessor :code

              # @return [Object] companiesCount
              attr_accessor :companies_count

              # @return [Float] id
              attr_accessor :id

              # @return [Object] latitude
              attr_accessor :latitude

              # @return [Object] linkedinHeadline
              attr_accessor :linkedin_headline

              # @return [Object] linkedinId
              attr_accessor :linkedin_id

              # @return [Object] linkedinQuery
              attr_accessor :linkedin_query

              # @return [Object] longitude
              attr_accessor :longitude

              # @return [String] name
              attr_accessor :name

              # @return [Object] nominatimCountryId
              attr_accessor :nominatim_country_id

              # @return [Object] nominatimStateId
              attr_accessor :nominatim_state_id

              # @return [Object] usageCount
              attr_accessor :usage_count

##
# Initialize a new NominatimCounty
#
# @param data [Hash] Initial data
def initialize(data = {})
                @cities_count = data['citiesCount']
                @code = data['code']
                @companies_count = data['companiesCount']
                @id = data['id']
                @latitude = data['latitude']
                @linkedin_headline = data['linkedinHeadline']
                @linkedin_id = data['linkedinId']
                @linkedin_query = data['linkedinQuery']
                @longitude = data['longitude']
                @name = data['name']
                @nominatim_country_id = data['nominatimCountryId']
                @nominatim_state_id = data['nominatimStateId']
                @usage_count = data['usageCount']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'citiesCount' => @cities_count,
                  'code' => @code,
                  'companiesCount' => @companies_count,
                  'id' => @id,
                  'latitude' => @latitude,
                  'linkedinHeadline' => @linkedin_headline,
                  'linkedinId' => @linkedin_id,
                  'linkedinQuery' => @linkedin_query,
                  'longitude' => @longitude,
                  'name' => @name,
                  'nominatimCountryId' => @nominatim_country_id,
                  'nominatimStateId' => @nominatim_state_id,
                  'usageCount' => @usage_count,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
