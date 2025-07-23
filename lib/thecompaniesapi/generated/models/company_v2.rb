# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # CompanyV2 model
      #
            # Our complete schema for company data.
class CompanyV2
              # @return [String] id
              attr_accessor :id

              # @return [Hash] about
              attr_accessor :about

              # @return [Hash] analytics
              attr_accessor :analytics

              # @return [Hash] The apps the company owns.
              attr_accessor :apps

              # @return [Hash] assets
              attr_accessor :assets

              # @return [Hash] codes
              attr_accessor :codes

              # @return [Hash] companies
              attr_accessor :companies

              # @return [Hash] contacts
              attr_accessor :contacts

              # @return [Hash] contents
              attr_accessor :contents

              # @return [Hash] descriptions
              attr_accessor :descriptions

              # @return [Hash] domain
              attr_accessor :domain

              # @return [Hash] finances
              attr_accessor :finances

              # @return [Hash] locations
              attr_accessor :locations

              # @return [Hash] meta
              attr_accessor :meta

              # @return [Hash] people
              attr_accessor :people

              # @return [Hash] secondaries
              attr_accessor :secondaries

              # @return [Hash] The social media pages of the company.
              attr_accessor :socials

              # @return [Hash] technologies
              attr_accessor :technologies

              # @return [Hash] urls
              attr_accessor :urls

              # @return [Hash] vectors
              attr_accessor :vectors

              # @return [Hash] The action results for the company.
              attr_accessor :action

##
# Initialize a new CompanyV2
#
# @param data [Hash] Initial data
def initialize(data = {})
                @id = data['id']
                @about = data['about']
                @analytics = data['analytics']
                @apps = data['apps']
                @assets = data['assets']
                @codes = data['codes']
                @companies = data['companies']
                @contacts = data['contacts']
                @contents = data['contents']
                @descriptions = data['descriptions']
                @domain = data['domain']
                @finances = data['finances']
                @locations = data['locations']
                @meta = data['meta']
                @people = data['people']
                @secondaries = data['secondaries']
                @socials = data['socials']
                @technologies = data['technologies']
                @urls = data['urls']
                @vectors = data['vectors']
                @action = data['action']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'id' => @id,
                  'about' => @about,
                  'analytics' => @analytics,
                  'apps' => @apps,
                  'assets' => @assets,
                  'codes' => @codes,
                  'companies' => @companies,
                  'contacts' => @contacts,
                  'contents' => @contents,
                  'descriptions' => @descriptions,
                  'domain' => @domain,
                  'finances' => @finances,
                  'locations' => @locations,
                  'meta' => @meta,
                  'people' => @people,
                  'secondaries' => @secondaries,
                  'socials' => @socials,
                  'technologies' => @technologies,
                  'urls' => @urls,
                  'vectors' => @vectors,
                  'action' => @action,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
