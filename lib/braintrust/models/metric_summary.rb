# frozen_string_literal: true

module Braintrust
  module Models
    class MetricSummary < Braintrust::Internal::Type::BaseModel
      # @!attribute improvements
      #   Number of improvements in the metric
      #
      #   @return [Integer]
      required :improvements, Integer

      # @!attribute metric
      #   Average metric across all examples
      #
      #   @return [Float]
      required :metric, Float

      # @!attribute name
      #   Name of the metric
      #
      #   @return [String]
      required :name, String

      # @!attribute regressions
      #   Number of regressions in the metric
      #
      #   @return [Integer]
      required :regressions, Integer

      # @!attribute unit
      #   Unit label for the metric
      #
      #   @return [String]
      required :unit, String

      # @!attribute diff
      #   Difference in metric between the current and comparison experiment
      #
      #   @return [Float, nil]
      optional :diff, Float

      # @!method initialize(improvements:, metric:, name:, regressions:, unit:, diff: nil)
      #   Summary of a metric's performance
      #
      #   @param improvements [Integer] Number of improvements in the metric
      #
      #   @param metric [Float] Average metric across all examples
      #
      #   @param name [String] Name of the metric
      #
      #   @param regressions [Integer] Number of regressions in the metric
      #
      #   @param unit [String] Unit label for the metric
      #
      #   @param diff [Float] Difference in metric between the current and comparison experiment
    end
  end
end
