# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # ListAnalytics model
      #
            # Analytics collection of a list.
class ListAnalytics
              # @return [Object] companiesCount
              attr_accessor :companies_count

              # @return [Float] id
              attr_accessor :id

              # @return [Object] listId
              attr_accessor :list_id

##
# Initialize a new ListAnalytics
#
# @param data [Hash] Initial data
def initialize(data = {})
                @companies_count = data['companiesCount']
                @id = data['id']
                @list_id = data['listId']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'companiesCount' => @companies_count,
                  'id' => @id,
                  'listId' => @list_id,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
