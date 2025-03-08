# typed: strong

module Braintrust
  module Models
    class ScoreSummary < Braintrust::BaseModel
      sig { returns(Integer) }
      def improvements
      end

      sig { params(_: Integer).returns(Integer) }
      def improvements=(_)
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

      sig { returns(Float) }
      def score
      end

      sig { params(_: Float).returns(Float) }
      def score=(_)
      end

      sig { returns(T.nilable(Float)) }
      def diff
      end

      sig { params(_: Float).returns(Float) }
      def diff=(_)
      end

      sig do
        params(improvements: Integer, name: String, regressions: Integer, score: Float, diff: Float)
          .returns(T.attached_class)
      end
      def self.new(improvements:, name:, regressions:, score:, diff: nil)
      end

      sig do
        override.returns(
          {
            improvements: Integer,
            name: String,
            regressions: Integer,
            score: Float,
            diff: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
