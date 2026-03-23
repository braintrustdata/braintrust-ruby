# typed: strong

module Braintrust
  module Models
    class AISecretReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::AISecretReplaceParams,
            Braintrust::Internal::AnyHash
          )
        end

      # Name of the AI secret
      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # For nearly all users, this parameter should be unnecessary. But in the rare case
      # that your API key belongs to multiple organizations, you may specify the name of
      # the organization the AI Secret belongs in.
      sig { returns(T.nilable(String)) }
      attr_accessor :org_name

      # Secret value. If omitted in a PUT request, the existing secret value will be
      # left intact, not replaced with null.
      sig { returns(T.nilable(String)) }
      attr_accessor :secret

      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig do
        params(
          name: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          org_name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the AI secret
        name:,
        metadata: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        # that your API key belongs to multiple organizations, you may specify the name of
        # the organization the AI Secret belongs in.
        org_name: nil,
        # Secret value. If omitted in a PUT request, the existing secret value will be
        # left intact, not replaced with null.
        secret: nil,
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            org_name: T.nilable(String),
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
