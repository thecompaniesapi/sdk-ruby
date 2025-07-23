# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # SegmentationCondition model
      #
            # A condition for our platform segmentation engine.
class SegmentationCondition
              # @return [String] attribute
              attr_accessor :attribute

              # @return [Boolean] blockedOperator
              attr_accessor :blocked_operator

              # @return [String] operator
              attr_accessor :operator

              # @return [String] sign
              attr_accessor :sign

              # @return [Array] values
              attr_accessor :values

##
# Initialize a new SegmentationCondition
#
# @param data [Hash] Initial data
def initialize(data = {})
                @attribute = data['attribute']
                @blocked_operator = data['blockedOperator']
                @operator = data['operator']
                @sign = data['sign']
                @values = data['values']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'attribute' => @attribute,
                  'blockedOperator' => @blocked_operator,
                  'operator' => @operator,
                  'sign' => @sign,
                  'values' => @values,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
