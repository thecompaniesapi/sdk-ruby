# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # PaginationMeta model
      #
            # Metadata about a paginated or billed response.
class PaginationMeta
              # @return [Float] cost
              attr_accessor :cost

              # @return [Float] credits
              attr_accessor :credits

              # @return [Float] currentPage
              attr_accessor :current_page

              # @return [Float] firstPage
              attr_accessor :first_page

              # @return [Boolean] freeRequest
              attr_accessor :free_request

              # @return [Float] lastPage
              attr_accessor :last_page

              # @return [Boolean] maxScrollResultsReached
              attr_accessor :max_scroll_results_reached

              # @return [Float] perPage
              attr_accessor :per_page

              # @return [Float] total
              attr_accessor :total

##
# Initialize a new PaginationMeta
#
# @param data [Hash] Initial data
def initialize(data = {})
                @cost = data['cost']
                @credits = data['credits']
                @current_page = data['currentPage']
                @first_page = data['firstPage']
                @free_request = data['freeRequest']
                @last_page = data['lastPage']
                @max_scroll_results_reached = data['maxScrollResultsReached']
                @per_page = data['perPage']
                @total = data['total']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'cost' => @cost,
                  'credits' => @credits,
                  'currentPage' => @current_page,
                  'firstPage' => @first_page,
                  'freeRequest' => @free_request,
                  'lastPage' => @last_page,
                  'maxScrollResultsReached' => @max_scroll_results_reached,
                  'perPage' => @per_page,
                  'total' => @total,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
