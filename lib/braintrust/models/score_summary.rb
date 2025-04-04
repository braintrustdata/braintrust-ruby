# frozen_string_literal: true

module Braintrust
  module Models
    class ScoreSummary < Braintrust::Internal::Type::BaseModel
      # @!attribute improvements
      #   Number of improvements in the score
      #
      #   @return [Integer]
      required :improvements, Integer

      # @!attribute name
      #   Name of the score
      #
      #   @return [String]
      required :name, String

      # @!attribute regressions
      #   Number of regressions in the score
      #
      #   @return [Integer]
      required :regressions, Integer

      # @!attribute score
      #   Average score across all examples
      #
      #   @return [Float]
      required :score, Float

      # @!attribute [r] diff
      #   Difference in score between the current and comparison experiment
      #
      #   @return [Float, nil]
      optional :diff, Float

      # @!parse
      #   # @return [Float]
      #   attr_writer :diff

      # @!parse
      #   # Summary of a score's performance
      #   #
      #   # @param improvements [Integer]
      #   # @param name [String]
      #   # @param regressions [Integer]
      #   # @param score [Float]
      #   # @param diff [Float]
      #   #
      #   def initialize(improvements:, name:, regressions:, score:, diff: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
