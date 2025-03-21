# typed: strong

module Braintrust
  module Models
    class ProjectScoreConfig < Braintrust::BaseModel
      sig { returns(T.nilable(String)) }
      def destination
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
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
        params(_: T.nilable(T.any(Braintrust::Models::OnlineScoreConfig, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::OnlineScoreConfig, Braintrust::Util::AnyHash)))
      end
      def online=(_)
      end

      sig do
        params(
          destination: T.nilable(String),
          multi_select: T.nilable(T::Boolean),
          online: T.nilable(Braintrust::Models::OnlineScoreConfig)
        )
          .returns(T.attached_class)
      end
      def self.new(destination: nil, multi_select: nil, online: nil)
      end

      sig do
        override
          .returns(
            {
              destination: T.nilable(String),
              multi_select: T.nilable(T::Boolean),
              online: T.nilable(Braintrust::Models::OnlineScoreConfig)
            }
          )
      end
      def to_hash
      end
    end
  end
end
