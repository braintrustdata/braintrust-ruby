# typed: strong

module Braintrust
  module Models
    class MetricSummary < Braintrust::BaseModel
      sig { returns(Integer) }
      def improvements
      end

      sig { params(_: Integer).returns(Integer) }
      def improvements=(_)
      end

      sig { returns(Float) }
      def metric
      end

      sig { params(_: Float).returns(Float) }
      def metric=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(Integer) }
      def regressions
      end

      sig { params(_: Integer).returns(Integer) }
      def regressions=(_)
      end

      sig { returns(String) }
      def unit
      end

      sig { params(_: String).returns(String) }
      def unit=(_)
      end

      sig { returns(T.nilable(Float)) }
      def diff
      end

      sig { params(_: Float).returns(Float) }
      def diff=(_)
      end

      sig do
        params(
          improvements: Integer,
          metric: Float,
          name: String,
          regressions: Integer,
          unit: String,
          diff: Float
        )
          .void
      end
      def initialize(improvements:, metric:, name:, regressions:, unit:, diff: nil)
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
