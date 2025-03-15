# typed: strong

module Braintrust
  module Resources
    class AISecrets
      # Create a new ai_secret. If there is an existing ai_secret with the same name as
      #   the one specified in the request, will return the existing ai_secret unmodified
      sig do
        params(
          name: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          org_name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def create(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      end

      # Get an ai_secret object by its id
      sig do
        params(
          ai_secret_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def retrieve(ai_secret_id, request_options: {})
      end

      # Partially update an ai_secret object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      sig do
        params(
          ai_secret_id: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def update(ai_secret_id, metadata: nil, name: nil, secret: nil, type: nil, request_options: {})
      end

      # List out all ai_secrets. The ai_secrets are sorted by creation date, with the
      #   most recently-created ai_secrets coming first
      sig do
        params(
          ai_secret_name: String,
          ai_secret_type: T.any(String, T::Array[String]),
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::AISecret])
      end
      def list(
        ai_secret_name: nil,
        ai_secret_type: nil,
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete an ai_secret object by its id
      sig do
        params(
          ai_secret_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def delete(ai_secret_id, request_options: {})
      end

      # Delete a single ai_secret
      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def find_and_delete(name:, org_name: nil, request_options: {})
      end

      # Create or replace ai_secret. If there is an existing ai_secret with the same
      #   name as the one specified in the request, will replace the existing ai_secret
      #   with the provided fields
      sig do
        params(
          name: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          org_name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def replace(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
