# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # List model
      #
            # A collection of companies saved or imported by a team.
class List
              # @return [Object] analytics
              attr_accessor :analytics

              # @return [Object] companyListId
              attr_accessor :company_list_id

              # @return [Object] createdAt
              attr_accessor :created_at

              # @return [Object] dynamic
              attr_accessor :dynamic

              # @return [Boolean] exporting
              attr_accessor :exporting

              # @return [Object] exportingAt
              attr_accessor :exporting_at

              # @return [Float] id
              attr_accessor :id

              # @return [Boolean] imported
              attr_accessor :imported

              # @return [Object] mailFrequencies
              attr_accessor :mail_frequencies

              # @return [Object] maxCompanies
              attr_accessor :max_companies

              # @return [String] name
              attr_accessor :name

              # @return [Boolean] processActive
              attr_accessor :process_active

              # @return [Object] processDisabled
              attr_accessor :process_disabled

              # @return [Object] processingAt
              attr_accessor :processing_at

              # @return [Boolean] processInitialized
              attr_accessor :process_initialized

              # @return [Object] processMessage
              attr_accessor :process_message

              # @return [Array] query
              attr_accessor :query

              # @return [Array] querySimilar
              attr_accessor :query_similar

              # @return [Object] teamId
              attr_accessor :team_id

              # @return [Array] unseenActions
              attr_accessor :unseen_actions

              # @return [Object] userId
              attr_accessor :user_id

              # @return [Array] vectors
              attr_accessor :vectors

##
# Initialize a new List
#
# @param data [Hash] Initial data
def initialize(data = {})
                @analytics = data['analytics']
                @company_list_id = data['companyListId']
                @created_at = data['createdAt']
                @dynamic = data['dynamic']
                @exporting = data['exporting']
                @exporting_at = data['exportingAt']
                @id = data['id']
                @imported = data['imported']
                @mail_frequencies = data['mailFrequencies']
                @max_companies = data['maxCompanies']
                @name = data['name']
                @process_active = data['processActive']
                @process_disabled = data['processDisabled']
                @processing_at = data['processingAt']
                @process_initialized = data['processInitialized']
                @process_message = data['processMessage']
                @query = data['query']
                @query_similar = data['querySimilar']
                @team_id = data['teamId']
                @unseen_actions = data['unseenActions']
                @user_id = data['userId']
                @vectors = data['vectors']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'analytics' => @analytics,
                  'companyListId' => @company_list_id,
                  'createdAt' => @created_at,
                  'dynamic' => @dynamic,
                  'exporting' => @exporting,
                  'exportingAt' => @exporting_at,
                  'id' => @id,
                  'imported' => @imported,
                  'mailFrequencies' => @mail_frequencies,
                  'maxCompanies' => @max_companies,
                  'name' => @name,
                  'processActive' => @process_active,
                  'processDisabled' => @process_disabled,
                  'processingAt' => @processing_at,
                  'processInitialized' => @process_initialized,
                  'processMessage' => @process_message,
                  'query' => @query,
                  'querySimilar' => @query_similar,
                  'teamId' => @team_id,
                  'unseenActions' => @unseen_actions,
                  'userId' => @user_id,
                  'vectors' => @vectors,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
