# typed: strong

module Braintrust
  module Models
    class ScoreSummary < Braintrust::BaseModel
      # Number of improvements in the score
      sig { returns(Integer) }
      def improvements
      end

      sig { params(_: Integer).returns(Integer) }
      def improvements=(_)
      end

      # Name of the score
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Number of regressions in the score
      sig { returns(Integer) }
      def regressions
      end

      sig { params(_: Integer).returns(Integer) }
      def regressions=(_)
      end

      # Average score across all examples
      sig { returns(Float) }
      def score
      end

      sig { params(_: Float).returns(Float) }
      def score=(_)
      end

      # Difference in score between the current and comparison experiment
      sig { returns(T.nilable(Float)) }
      def diff
      end

      sig { params(_: Float).returns(Float) }
      def diff=(_)
      end

      # Summary of a score's performance
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
