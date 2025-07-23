# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # PageContentsIdeated model
      #
            # A collection of categorized facts about a company aggregated from multiple sources.
class PageContentsIdeated
              # @return [String] domain
              attr_accessor :domain

              # @return [Array] about
              attr_accessor :about

              # @return [Array] acquired
              attr_accessor :acquired

              # @return [Array] contacts
              attr_accessor :contacts

              # @return [Array] customers
              attr_accessor :customers

              # @return [Array] features
              attr_accessor :features

              # @return [Array] finances
              attr_accessor :finances

              # @return [Array] industries
              attr_accessor :industries

              # @return [Array] jobs
              attr_accessor :jobs

              # @return [Array] locations
              attr_accessor :locations

              # @return [Array] others
              attr_accessor :others

              # @return [Array] pricing
              attr_accessor :pricing

              # @return [Array] related
              attr_accessor :related

              # @return [Array] resources
              attr_accessor :resources

              # @return [Array] security
              attr_accessor :security

              # @return [Array] social
              attr_accessor :social

              # @return [Array] solutions
              attr_accessor :solutions

              # @return [Array] support
              attr_accessor :support

              # @return [Array] team
              attr_accessor :team

              # @return [Array] technologies
              attr_accessor :technologies

              # @return [Array] updates
              attr_accessor :updates

              # @return [Boolean] broken
              attr_accessor :broken

              # @return [Boolean] closed
              attr_accessor :closed

              # @return [Boolean] forSale
              attr_accessor :for_sale

              # @return [Boolean] nsfw
              attr_accessor :nsfw

              # @return [String] updatedAt
              attr_accessor :updated_at

              # @return [Array] sources
              attr_accessor :sources

              # @return [Float] tokens
              attr_accessor :tokens

##
# Initialize a new PageContentsIdeated
#
# @param data [Hash] Initial data
def initialize(data = {})
                @domain = data['domain']
                @about = data['about']
                @acquired = data['acquired']
                @contacts = data['contacts']
                @customers = data['customers']
                @features = data['features']
                @finances = data['finances']
                @industries = data['industries']
                @jobs = data['jobs']
                @locations = data['locations']
                @others = data['others']
                @pricing = data['pricing']
                @related = data['related']
                @resources = data['resources']
                @security = data['security']
                @social = data['social']
                @solutions = data['solutions']
                @support = data['support']
                @team = data['team']
                @technologies = data['technologies']
                @updates = data['updates']
                @broken = data['broken']
                @closed = data['closed']
                @for_sale = data['forSale']
                @nsfw = data['nsfw']
                @updated_at = data['updatedAt']
                @sources = data['sources']
                @tokens = data['tokens']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'domain' => @domain,
                  'about' => @about,
                  'acquired' => @acquired,
                  'contacts' => @contacts,
                  'customers' => @customers,
                  'features' => @features,
                  'finances' => @finances,
                  'industries' => @industries,
                  'jobs' => @jobs,
                  'locations' => @locations,
                  'others' => @others,
                  'pricing' => @pricing,
                  'related' => @related,
                  'resources' => @resources,
                  'security' => @security,
                  'social' => @social,
                  'solutions' => @solutions,
                  'support' => @support,
                  'team' => @team,
                  'technologies' => @technologies,
                  'updates' => @updates,
                  'broken' => @broken,
                  'closed' => @closed,
                  'forSale' => @for_sale,
                  'nsfw' => @nsfw,
                  'updatedAt' => @updated_at,
                  'sources' => @sources,
                  'tokens' => @tokens,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
