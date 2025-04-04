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

      # @!parse
      #   # For categorical-type project scores, defines a single category
      #   #
      #   # @param name [String]
      #   # @param value [Float]
      #   #
      #   def initialize(name:, value:, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
