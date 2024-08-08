# frozen_string_literal: true

module Braintrust
  module Models
    class MetricSummary < BaseModel
      # @!attribute [rw] improvements
      #   Number of improvements in the metric
      #   @return [Integer]
      required :improvements, Integer

      # @!attribute [rw] metric
      #   Average metric across all examples
      #   @return [Float]
      required :metric, Float

      # @!attribute [rw] name_
      #   Name of the metric
      #   @return [String]
      required :name_, String

      # @!attribute [rw] regressions
      #   Number of regressions in the metric
      #   @return [Integer]
      required :regressions, Integer

      # @!attribute [rw] unit
      #   Unit label for the metric
      #   @return [String]
      required :unit, String

      # @!attribute [rw] diff
      #   Difference in metric between the current and comparison experiment
      #   @return [Float]
      optional :diff, Float
    end
  end
end
