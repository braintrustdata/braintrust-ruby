# typed: strong

module Braintrust
  module Models
    class EnvVarUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # The name of the environment variable
      sig { returns(String) }
      attr_accessor :name

      # The value of the environment variable. Will be encrypted at rest.
      sig { returns(T.nilable(String)) }
      attr_accessor :value

      sig do
        params(
          name: String,
          value: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, value: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            name: String,
            value: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
