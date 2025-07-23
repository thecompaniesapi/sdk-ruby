# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # EmailPattern model
      #
            # An email pattern and its related informations.
class EmailPattern
              # @return [Object] emailsCount
              attr_accessor :emails_count

              # @return [Float] id
              attr_accessor :id

              # @return [String] pattern
              attr_accessor :pattern

              # @return [Object] usagePercentage
              attr_accessor :usage_percentage

##
# Initialize a new EmailPattern
#
# @param data [Hash] Initial data
def initialize(data = {})
                @emails_count = data['emailsCount']
                @id = data['id']
                @pattern = data['pattern']
                @usage_percentage = data['usagePercentage']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'emailsCount' => @emails_count,
                  'id' => @id,
                  'pattern' => @pattern,
                  'usagePercentage' => @usage_percentage,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
