# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreCategory < Braintrust::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the category
      #
      #   @return [String]
      required :name, String

      # @!attribute value
      #   Numerical value of the category. Must be between 0 and 1, inclusive
      #
      #   @return [Float]
      required :value, Float

      # @!method initialize(name:, value:)
      #   For categorical-type project scores, defines a single category
      #
      #   @param name [String] Name of the category
      #
      #   @param value [Float] Numerical value of the category. Must be between 0 and 1, inclusive
    end
  end
end
