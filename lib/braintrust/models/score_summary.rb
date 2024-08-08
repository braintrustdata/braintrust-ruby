# frozen_string_literal: true

module Braintrust
  module Models
    class ScoreSummary < BaseModel
      # @!attribute [rw] improvements
      #   Number of improvements in the score
      #   @return [Integer]
      required :improvements, Integer

      # @!attribute [rw] name_
      #   Name of the score
      #   @return [String]
      required :name_, String

      # @!attribute [rw] regressions
      #   Number of regressions in the score
      #   @return [Integer]
      required :regressions, Integer

      # @!attribute [rw] score
      #   Average score across all examples
      #   @return [Float]
      required :score, Float

      # @!attribute [rw] diff
      #   Difference in score between the current and comparison experiment
      #   @return [Float]
      optional :diff, Float
    end
  end
end
