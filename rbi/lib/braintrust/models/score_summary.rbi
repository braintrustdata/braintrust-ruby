# typed: strong

module Braintrust
  module Models
    class ScoreSummary < Braintrust::Internal::Type::BaseModel
      # Number of improvements in the score
      sig { returns(Integer) }
      attr_accessor :improvements

      # Name of the score
      sig { returns(String) }
      attr_accessor :name

      # Number of regressions in the score
      sig { returns(Integer) }
      attr_accessor :regressions

      # Average score across all examples
      sig { returns(Float) }
      attr_accessor :score

      # Difference in score between the current and comparison experiment
      sig { returns(T.nilable(Float)) }
      attr_reader :diff

      sig { params(diff: Float).void }
      attr_writer :diff

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
