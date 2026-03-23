# typed: strong

module Braintrust
  module Models
    class EnvVarUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::EnvVarUpdateParams, Braintrust::Internal::AnyHash)
        end

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
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the environment variable
        name:,
        # The value of the environment variable. Will be encrypted at rest.
        value: nil,
        request_options: {}
      )
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
