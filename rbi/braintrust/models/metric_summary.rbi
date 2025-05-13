# typed: strong

module Braintrust
  module Models
    class MetricSummary < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::MetricSummary, Braintrust::Internal::AnyHash)
        end

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
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of improvements in the metric
        improvements:,
        # Average metric across all examples
        metric:,
        # Name of the metric
        name:,
        # Number of regressions in the metric
        regressions:,
        # Unit label for the metric
        unit:,
        # Difference in metric between the current and comparison experiment
        diff: nil
      )
      end

      sig do
        override.returns(
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
