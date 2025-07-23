# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # PageContentsLink model
      #
            # A link found in a page content.
class PageContentsLink
              # @return [String] text
              attr_accessor :text

              # @return [String] url
              attr_accessor :url

##
# Initialize a new PageContentsLink
#
# @param data [Hash] Initial data
def initialize(data = {})
                @text = data['text']
                @url = data['url']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'text' => @text,
                  'url' => @url,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
