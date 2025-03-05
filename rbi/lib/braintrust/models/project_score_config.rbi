# typed: strong

module Braintrust
  module Models
    class ProjectScoreConfig < Braintrust::BaseModel
      sig { returns(T.nilable(Symbol)) }
      def destination
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def destination=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def multi_select
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def multi_select=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::OnlineScoreConfig)) }
      def online
      end

      sig do
        params(_: T.nilable(Braintrust::Models::OnlineScoreConfig))
          .returns(T.nilable(Braintrust::Models::OnlineScoreConfig))
      end
      def online=(_)
      end

      sig do
        params(
          destination: T.nilable(Symbol),
          multi_select: T.nilable(T::Boolean),
          online: T.nilable(Braintrust::Models::OnlineScoreConfig)
        )
          .void
      end
      def initialize(destination: nil, multi_select: nil, online: nil)
      end

      sig do
        override
          .returns(
            {
              destination: T.nilable(Symbol),
              multi_select: T.nilable(T::Boolean),
              online: T.nilable(Braintrust::Models::OnlineScoreConfig)
            }
          )
      end
      def to_hash
      end

      class Destination < Braintrust::Enum
        abstract!

        EXPECTED = T.let(:expected, T.nilable(Symbol))

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end
    end
  end
end
