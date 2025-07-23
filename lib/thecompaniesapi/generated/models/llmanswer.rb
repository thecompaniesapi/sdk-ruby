# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # Llmanswer model
      #
            # An answer from a query made to the LLM.
class Llmanswer
              # @return [Float] companyId
              attr_accessor :company_id

              # @return [String] explanation
              attr_accessor :explanation

              # @return [Array] fields
              attr_accessor :fields

              # @return [Boolean] grounded
              attr_accessor :grounded

              # @return [Hash] output
              attr_accessor :output

              # @return [String] question
              attr_accessor :question

              # @return [Float] score
              attr_accessor :score

##
# Initialize a new Llmanswer
#
# @param data [Hash] Initial data
def initialize(data = {})
                @company_id = data['companyId']
                @explanation = data['explanation']
                @fields = data['fields']
                @grounded = data['grounded']
                @output = data['output']
                @question = data['question']
                @score = data['score']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'companyId' => @company_id,
                  'explanation' => @explanation,
                  'fields' => @fields,
                  'grounded' => @grounded,
                  'output' => @output,
                  'question' => @question,
                  'score' => @score,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
