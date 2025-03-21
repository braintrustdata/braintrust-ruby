# typed: strong

module Braintrust
  module Models
    class AISecretFindAndDeleteParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the AI secret
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the AI Secret belongs in.
      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_name=(_)
      end

      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, org_name: nil, request_options: {})
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
