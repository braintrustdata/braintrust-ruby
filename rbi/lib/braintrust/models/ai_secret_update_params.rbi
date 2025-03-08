# typed: strong

module Braintrust
  module Models
    class AISecretUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(String)) }
      def secret
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def secret=(_)
      end

      sig { returns(T.nilable(String)) }
      def type
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def type=(_)
      end

      sig do
        params(
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(metadata: nil, name: nil, secret: nil, type: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              name: T.nilable(String),
              secret: T.nilable(String),
              type: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
