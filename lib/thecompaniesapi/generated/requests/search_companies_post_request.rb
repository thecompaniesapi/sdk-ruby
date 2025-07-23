# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Requests
      ##
      # SearchCompaniesPostRequest - API request class
      #
class SearchCompaniesPostRequest
              # @return [Float] actionId
              attr_accessor :action_id

              # @return [String] domainsToExclude
              attr_accessor :domains_to_exclude

              # @return [String] linkedinToExclude
              attr_accessor :linkedin_to_exclude

              # @return [Float] page
              attr_accessor :page

              # @return [Array] query
              attr_accessor :query

              # @return [String] search
              attr_accessor :search

              # @return [Array] searchFields
              attr_accessor :search_fields

              # @return [Boolean] simplified
              attr_accessor :simplified

              # @return [Float] size
              attr_accessor :size

              # @return [Array] sortFields
              attr_accessor :sort_fields

              # @return [String] sortKey
              attr_accessor :sort_key

              # @return [String] sortOrder
              attr_accessor :sort_order

##
# Initialize a new SearchCompaniesPostRequest
#
# @param data [Hash] Request data
def initialize(data = {})
                @action_id = data['actionId'] || data[:action_id]
                @domains_to_exclude = data['domainsToExclude'] || data[:domains_to_exclude]
                @linkedin_to_exclude = data['linkedinToExclude'] || data[:linkedin_to_exclude]
                @page = data['page'] || data[:page]
                @query = data['query'] || data[:query]
                @search = data['search'] || data[:search]
                @search_fields = data['searchFields'] || data[:search_fields]
                @simplified = data['simplified'] || data[:simplified]
                @size = data['size'] || data[:size]
                @sort_fields = data['sortFields'] || data[:sort_fields]
                @sort_key = data['sortKey'] || data[:sort_key]
                @sort_order = data['sortOrder'] || data[:sort_order]
end

##
# Convert to hash for API request
#
# @return [Hash] Hash representation
def to_hash
  {
                  'actionId' => @action_id,
                  'domainsToExclude' => @domains_to_exclude,
                  'linkedinToExclude' => @linkedin_to_exclude,
                  'page' => @page,
                  'query' => @query,
                  'search' => @search,
                  'searchFields' => @search_fields,
                  'simplified' => @simplified,
                  'size' => @size,
                  'sortFields' => @sort_fields,
                  'sortKey' => @sort_key,
                  'sortOrder' => @sort_order,
          }.compact
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
