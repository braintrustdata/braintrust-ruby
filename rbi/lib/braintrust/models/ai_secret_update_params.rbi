# typed: strong

module Braintrust
  module Models
    class AISecretUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # Name of the AI secret
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :secret

      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig do
        params(
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
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
