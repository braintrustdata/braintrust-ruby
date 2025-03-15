# typed: strong

module Braintrust
  module Models
    class MetricSummary < Braintrust::BaseModel
      # Number of improvements in the metric
      sig { returns(Integer) }
      def improvements
      end

      sig { params(_: Integer).returns(Integer) }
      def improvements=(_)
      end

      # Average metric across all examples
      sig { returns(Float) }
      def metric
      end

      sig { params(_: Float).returns(Float) }
      def metric=(_)
      end

      # Name of the metric
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Number of regressions in the metric
      sig { returns(Integer) }
      def regressions
      end

      sig { params(_: Integer).returns(Integer) }
      def regressions=(_)
      end

      # Unit label for the metric
      sig { returns(String) }
      def unit
      end

      sig { params(_: String).returns(String) }
      def unit=(_)
      end

      # Difference in metric between the current and comparison experiment
      sig { returns(T.nilable(Float)) }
      def diff
      end

      sig { params(_: Float).returns(Float) }
      def diff=(_)
      end

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
