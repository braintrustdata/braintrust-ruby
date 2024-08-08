# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreCategory < BaseModel
      # @!attribute [rw] name_
      #   Name of the category
      #   @return [String]
      required :name_, String

      # @!attribute [rw] value
      #   Numerical value of the category. Must be between 0 and 1, inclusive
      #   @return [Float]
      required :value, Float
    end
  end
end
