# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # NominatimContinent model
      #
            # A continent from the Nominatim API.
class NominatimContinent
              # @return [Object] citiesCount
              attr_accessor :cities_count

              # @return [String] code
              attr_accessor :code

              # @return [Object] companiesCount
              attr_accessor :companies_count

              # @return [Object] countiesCount
              attr_accessor :counties_count

              # @return [Object] countriesCount
              attr_accessor :countries_count

              # @return [Object] icon
              attr_accessor :icon

              # @return [Float] id
              attr_accessor :id

              # @return [Object] latitude
              attr_accessor :latitude

              # @return [Object] linkedinHeadline
              attr_accessor :linkedin_headline

              # @return [Object] linkedinId
              attr_accessor :linkedin_id

              # @return [Object] longitude
              attr_accessor :longitude

              # @return [String] name
              attr_accessor :name

              # @return [String] nameEs
              attr_accessor :name_es

              # @return [String] nameFr
              attr_accessor :name_fr

              # @return [Object] statesCount
              attr_accessor :states_count

              # @return [Object] usageCount
              attr_accessor :usage_count

##
# Initialize a new NominatimContinent
#
# @param data [Hash] Initial data
def initialize(data = {})
                @cities_count = data['citiesCount']
                @code = data['code']
                @companies_count = data['companiesCount']
                @counties_count = data['countiesCount']
                @countries_count = data['countriesCount']
                @icon = data['icon']
                @id = data['id']
                @latitude = data['latitude']
                @linkedin_headline = data['linkedinHeadline']
                @linkedin_id = data['linkedinId']
                @longitude = data['longitude']
                @name = data['name']
                @name_es = data['nameEs']
                @name_fr = data['nameFr']
                @states_count = data['statesCount']
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
                  'countiesCount' => @counties_count,
                  'countriesCount' => @countries_count,
                  'icon' => @icon,
                  'id' => @id,
                  'latitude' => @latitude,
                  'linkedinHeadline' => @linkedin_headline,
                  'linkedinId' => @linkedin_id,
                  'longitude' => @longitude,
                  'name' => @name,
                  'nameEs' => @name_es,
                  'nameFr' => @name_fr,
                  'statesCount' => @states_count,
                  'usageCount' => @usage_count,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
