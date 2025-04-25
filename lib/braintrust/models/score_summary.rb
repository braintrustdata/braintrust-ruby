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

      # @!attribute diff
      #   Difference in score between the current and comparison experiment
      #
      #   @return [Float, nil]
      optional :diff, Float

      # @!method initialize(improvements:, name:, regressions:, score:, diff: nil)
      #   Summary of a score's performance
      #
      #   @param improvements [Integer] Number of improvements in the score
      #
      #   @param name [String] Name of the score
      #
      #   @param regressions [Integer] Number of regressions in the score
      #
      #   @param score [Float] Average score across all examples
      #
      #   @param diff [Float] Difference in score between the current and comparison experiment
    end
  end
end
