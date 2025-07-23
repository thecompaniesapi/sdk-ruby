# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # PageContentsPage model
      #
            # A page content saved as a source for a company context.
class PageContentsPage
              # @return [String] url
              attr_accessor :url

              # @return [String] content
              attr_accessor :content

              # @return [String] html
              attr_accessor :html

              # @return [String] description
              attr_accessor :description

              # @return [String] title
              attr_accessor :title

              # @return [Array] externals
              attr_accessor :externals

              # @return [Array] navigation
              attr_accessor :navigation

              # @return [String] visitedAt
              attr_accessor :visited_at

##
# Initialize a new PageContentsPage
#
# @param data [Hash] Initial data
def initialize(data = {})
                @url = data['url']
                @content = data['content']
                @html = data['html']
                @description = data['description']
                @title = data['title']
                @externals = data['externals']
                @navigation = data['navigation']
                @visited_at = data['visitedAt']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'url' => @url,
                  'content' => @content,
                  'html' => @html,
                  'description' => @description,
                  'title' => @title,
                  'externals' => @externals,
                  'navigation' => @navigation,
                  'visitedAt' => @visited_at,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
