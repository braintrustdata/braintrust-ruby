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
      required :name_, String, api_name: :name

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

      # @!parse
      #   # Create a new instance of ScoreSummary from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :improvements Number of improvements in the score
      #   #   @option data [String] :name Name of the score
      #   #   @option data [Integer] :regressions Number of regressions in the score
      #   #   @option data [Float] :score Average score across all examples
      #   #   @option data [Float, nil] :diff Difference in score between the current and comparison experiment
      #   def initialize(data = {}) = super
    end
  end
end
