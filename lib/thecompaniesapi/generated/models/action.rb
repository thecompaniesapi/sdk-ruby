# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # Action model
      #
            # An action tracks a request made to our job queue and its result.
class Action
              # @return [Float] attempts
              attr_accessor :attempts

              # @return [Object] cost
              attr_accessor :cost

              # @return [Object] createdAt
              attr_accessor :created_at

              # @return [Hash] data
              attr_accessor :data

              # @return [Float] id
              attr_accessor :id

              # @return [Float] listId
              attr_accessor :list_id

              # @return [Float] promptId
              attr_accessor :prompt_id

              # @return [Hash] result
              attr_accessor :result

              # @return [String] status
              attr_accessor :status

              # @return [Float] teamId
              attr_accessor :team_id

              # @return [String] type
              attr_accessor :type

              # @return [Object] updatedAt
              attr_accessor :updated_at

##
# Initialize a new Action
#
# @param data [Hash] Initial data
def initialize(data = {})
                @attempts = data['attempts']
                @cost = data['cost']
                @created_at = data['createdAt']
                @data = data['data']
                @id = data['id']
                @list_id = data['listId']
                @prompt_id = data['promptId']
                @result = data['result']
                @status = data['status']
                @team_id = data['teamId']
                @type = data['type']
                @updated_at = data['updatedAt']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'attempts' => @attempts,
                  'cost' => @cost,
                  'createdAt' => @created_at,
                  'data' => @data,
                  'id' => @id,
                  'listId' => @list_id,
                  'promptId' => @prompt_id,
                  'result' => @result,
                  'status' => @status,
                  'teamId' => @team_id,
                  'type' => @type,
                  'updatedAt' => @updated_at,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
