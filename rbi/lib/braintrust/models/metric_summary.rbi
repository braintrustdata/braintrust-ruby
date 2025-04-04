# typed: strong

module Braintrust
  module Models
    class MetricSummary < Braintrust::Internal::Type::BaseModel
      # Number of improvements in the metric
      sig { returns(Integer) }
      attr_accessor :improvements

      # Average metric across all examples
      sig { returns(Float) }
      attr_accessor :metric

      # Name of the metric
      sig { returns(String) }
      attr_accessor :name

      # Number of regressions in the metric
      sig { returns(Integer) }
      attr_accessor :regressions

      # Unit label for the metric
      sig { returns(String) }
      attr_accessor :unit

      # Difference in metric between the current and comparison experiment
      sig { returns(T.nilable(Float)) }
      attr_reader :diff

      sig { params(diff: Float).void }
      attr_writer :diff

      # Summary of a metric's performance
      sig do
        params(
          improvements: Integer,
          metric: Float,
          name: String,
          regressions: Integer,
          unit: String,
          diff: Float
        )
          .returns(T.attached_class)
      end
      def self.new(improvements:, metric:, name:, regressions:, unit:, diff: nil)
      end

      sig do
        override
          .returns(
            {
              improvements: Integer,
              metric: Float,
              name: String,
              regressions: Integer,
              unit: String,
              diff: Float
            }
          )
      end
      def to_hash
      end
    end
  end
end
