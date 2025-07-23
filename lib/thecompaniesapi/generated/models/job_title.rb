# frozen_string_literal: true

module TheCompaniesAPI
  module Generated
    module Models
      ##
      # JobTitle model
      #
            # A job title and its related informations.
class JobTitle
              # @return [Object] department
              attr_accessor :department

              # @return [Object] departmentSecondary
              attr_accessor :department_secondary

              # @return [Float] id
              attr_accessor :id

              # @return [Object] linkedinCount
              attr_accessor :linkedin_count

              # @return [String] name
              attr_accessor :name

              # @return [Object] nameEs
              attr_accessor :name_es

              # @return [Object] nameFr
              attr_accessor :name_fr

              # @return [Object] seniorityLevel
              attr_accessor :seniority_level

              # @return [Object] seniorityLevelSecondary
              attr_accessor :seniority_level_secondary

              # @return [Object] usageCount
              attr_accessor :usage_count

##
# Initialize a new JobTitle
#
# @param data [Hash] Initial data
def initialize(data = {})
                @department = data['department']
                @department_secondary = data['departmentSecondary']
                @id = data['id']
                @linkedin_count = data['linkedinCount']
                @name = data['name']
                @name_es = data['nameEs']
                @name_fr = data['nameFr']
                @seniority_level = data['seniorityLevel']
                @seniority_level_secondary = data['seniorityLevelSecondary']
                @usage_count = data['usageCount']
end

##
# Convert to hash
#
# @return [Hash] Hash representation
def to_hash
  {
                  'department' => @department,
                  'departmentSecondary' => @department_secondary,
                  'id' => @id,
                  'linkedinCount' => @linkedin_count,
                  'name' => @name,
                  'nameEs' => @name_es,
                  'nameFr' => @name_fr,
                  'seniorityLevel' => @seniority_level,
                  'seniorityLevelSecondary' => @seniority_level_secondary,
                  'usageCount' => @usage_count,
          }
        end

        alias_method :to_h, :to_hash
      end
    end
  end
end
