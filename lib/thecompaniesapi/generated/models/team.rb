# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # Team model
      #
            # A collection of users that can access the same resources.
class Team
              # @return [Object] admin
              attr_accessor :admin

              # @return [Object] country
              attr_accessor :country

              # @return [Object] createdAt
              attr_accessor :created_at

              # @return [Float] credits
              attr_accessor :credits

              # @return [Float] creditsPack
              attr_accessor :credits_pack

              # @return [Float] id
              attr_accessor :id

              # @return [Object] name
              attr_accessor :name

              # @return [Object] role
              attr_accessor :role

              # @return [Object] stripeCustomerId
              attr_accessor :stripe_customer_id

              # @return [Object] stripeProductId
              attr_accessor :stripe_product_id

              # @return [Boolean] stripeSubscribed
              attr_accessor :stripe_subscribed

              # @return [Object] stripeSubscriptionId
              attr_accessor :stripe_subscription_id

              # @return [Object] stripeSubscriptionStatus
              attr_accessor :stripe_subscription_status

              # @return [Object] websiteUrl
              attr_accessor :website_url

##
# Initialize a new Team
#
# @param data [Hash] Initial data
def initialize(data = {})
                @admin = data['admin']
                @country = data['country']
                @created_at = data['createdAt']
                @credits = data['credits']
                @credits_pack = data['creditsPack']
                @id = data['id']
                @name = data['name']
                @role = data['role']
                @stripe_customer_id = data['stripeCustomerId']
                @stripe_product_id = data['stripeProductId']
                @stripe_subscribed = data['stripeSubscribed']
                @stripe_subscription_id = data['stripeSubscriptionId']
                @stripe_subscription_status = data['stripeSubscriptionStatus']
                @website_url = data['websiteUrl']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'admin' => @admin,
                  'country' => @country,
                  'createdAt' => @created_at,
                  'credits' => @credits,
                  'creditsPack' => @credits_pack,
                  'id' => @id,
                  'name' => @name,
                  'role' => @role,
                  'stripeCustomerId' => @stripe_customer_id,
                  'stripeProductId' => @stripe_product_id,
                  'stripeSubscribed' => @stripe_subscribed,
                  'stripeSubscriptionId' => @stripe_subscription_id,
                  'stripeSubscriptionStatus' => @stripe_subscription_status,
                  'websiteUrl' => @website_url,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
