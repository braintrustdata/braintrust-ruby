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
      required :name_, String, api_name: :name

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

      # @!parse
      #   # Create a new instance of MetricSummary from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :improvements Number of improvements in the metric
      #   #   @option data [Float] :metric Average metric across all examples
      #   #   @option data [String] :name Name of the metric
      #   #   @option data [Integer] :regressions Number of regressions in the metric
      #   #   @option data [String] :unit Unit label for the metric
      #   #   @option data [Float, nil] :diff Difference in metric between the current and comparison experiment
      #   def initialize(data = {}) = super
    end
  end
end
