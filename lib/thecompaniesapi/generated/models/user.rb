# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # User model
      #
            # A user of the platform.
class User
              # @return [String] colorMode
              attr_accessor :color_mode

              # @return [Object] createdAt
              attr_accessor :created_at

              # @return [Object] currentTeamId
              attr_accessor :current_team_id

              # @return [String] email
              attr_accessor :email

              # @return [Object] emailFree
              attr_accessor :email_free

              # @return [Object] emailVerified
              attr_accessor :email_verified

              # @return [Object] emailVerifiedResentAt
              attr_accessor :email_verified_resent_at

              # @return [Object] fullName
              attr_accessor :full_name

              # @return [Object] hasPassword
              attr_accessor :has_password

              # @return [Float] id
              attr_accessor :id

              # @return [Object] locale
              attr_accessor :locale

              # @return [Object] pictureUrl
              attr_accessor :picture_url

              # @return [Object] referral
              attr_accessor :referral

              # @return [Object] role
              attr_accessor :role

##
# Initialize a new User
#
# @param data [Hash] Initial data
def initialize(data = {})
                @color_mode = data['colorMode']
                @created_at = data['createdAt']
                @current_team_id = data['currentTeamId']
                @email = data['email']
                @email_free = data['emailFree']
                @email_verified = data['emailVerified']
                @email_verified_resent_at = data['emailVerifiedResentAt']
                @full_name = data['fullName']
                @has_password = data['hasPassword']
                @id = data['id']
                @locale = data['locale']
                @picture_url = data['pictureUrl']
                @referral = data['referral']
                @role = data['role']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'colorMode' => @color_mode,
                  'createdAt' => @created_at,
                  'currentTeamId' => @current_team_id,
                  'email' => @email,
                  'emailFree' => @email_free,
                  'emailVerified' => @email_verified,
                  'emailVerifiedResentAt' => @email_verified_resent_at,
                  'fullName' => @full_name,
                  'hasPassword' => @has_password,
                  'id' => @id,
                  'locale' => @locale,
                  'pictureUrl' => @picture_url,
                  'referral' => @referral,
                  'role' => @role,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
