# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # NominatimCountry model
      #
            # A country from the Nominatim API.
class NominatimCountry
              # @return [Object] citiesCount
              attr_accessor :cities_count

              # @return [String] code
              attr_accessor :code

              # @return [Object] companiesCount
              attr_accessor :companies_count

              # @return [Object] continent
              attr_accessor :continent

              # @return [Object] continentCode
              attr_accessor :continent_code

              # @return [Object] countiesCount
              attr_accessor :counties_count

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

              # @return [String] nameNative
              attr_accessor :name_native

              # @return [Object] population
              attr_accessor :population

              # @return [Object] statesCount
              attr_accessor :states_count

              # @return [Object] usageCount
              attr_accessor :usage_count

##
# Initialize a new NominatimCountry
#
# @param data [Hash] Initial data
def initialize(data = {})
                @cities_count = data['citiesCount']
                @code = data['code']
                @companies_count = data['companiesCount']
                @continent = data['continent']
                @continent_code = data['continentCode']
                @counties_count = data['countiesCount']
                @id = data['id']
                @latitude = data['latitude']
                @linkedin_headline = data['linkedinHeadline']
                @linkedin_id = data['linkedinId']
                @longitude = data['longitude']
                @name = data['name']
                @name_es = data['nameEs']
                @name_fr = data['nameFr']
                @name_native = data['nameNative']
                @population = data['population']
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
                  'continent' => @continent,
                  'continentCode' => @continent_code,
                  'countiesCount' => @counties_count,
                  'id' => @id,
                  'latitude' => @latitude,
                  'linkedinHeadline' => @linkedin_headline,
                  'linkedinId' => @linkedin_id,
                  'longitude' => @longitude,
                  'name' => @name,
                  'nameEs' => @name_es,
                  'nameFr' => @name_fr,
                  'nameNative' => @name_native,
                  'population' => @population,
                  'statesCount' => @states_count,
                  'usageCount' => @usage_count,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
