# typed: strong

module Braintrust
  module Models
    class APIKeyCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::APIKeyCreateParams, Braintrust::Internal::AnyHash)
        end

      # Name of the api key. Does not have to be unique
      sig { returns(String) }
      attr_accessor :name

      # For nearly all users, this parameter should be unnecessary. But in the rare case
      # that your API key belongs to multiple organizations, you may specify the name of
      # the organization the API key belongs in.
      sig { returns(T.nilable(String)) }
      attr_accessor :org_name

      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the api key. Does not have to be unique
        name:,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        # that your API key belongs to multiple organizations, you may specify the name of
        # the organization the API key belongs in.
        org_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            org_name: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
