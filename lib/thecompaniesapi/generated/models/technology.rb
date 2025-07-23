# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # Technology model
      #
            # A technology description from our platform.
class Technology
              # @return [Object] categories
              attr_accessor :categories

              # @return [Object] companiesCount
              attr_accessor :companies_count

              # @return [Object] createdAt
              attr_accessor :created_at

              # @return [String] editor
              attr_accessor :editor

              # @return [Object] free
              attr_accessor :free

              # @return [Float] id
              attr_accessor :id

              # @return [String] name
              attr_accessor :name

              # @return [Object] nameSynonyms
              attr_accessor :name_synonyms

              # @return [Object] paid
              attr_accessor :paid

              # @return [String] slug
              attr_accessor :slug

              # @return [Object] updatedAt
              attr_accessor :updated_at

              # @return [Object] usageCount
              attr_accessor :usage_count

              # @return [Object] websiteUrl
              attr_accessor :website_url

##
# Initialize a new Technology
#
# @param data [Hash] Initial data
def initialize(data = {})
                @categories = data['categories']
                @companies_count = data['companiesCount']
                @created_at = data['createdAt']
                @editor = data['editor']
                @free = data['free']
                @id = data['id']
                @name = data['name']
                @name_synonyms = data['nameSynonyms']
                @paid = data['paid']
                @slug = data['slug']
                @updated_at = data['updatedAt']
                @usage_count = data['usageCount']
                @website_url = data['websiteUrl']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'categories' => @categories,
                  'companiesCount' => @companies_count,
                  'createdAt' => @created_at,
                  'editor' => @editor,
                  'free' => @free,
                  'id' => @id,
                  'name' => @name,
                  'nameSynonyms' => @name_synonyms,
                  'paid' => @paid,
                  'slug' => @slug,
                  'updatedAt' => @updated_at,
                  'usageCount' => @usage_count,
                  'websiteUrl' => @website_url,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
