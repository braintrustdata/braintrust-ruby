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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def create(
        # Name of the AI secret
        name:,
        metadata: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the AI Secret belongs in.
        org_name: nil,
        # Secret value. If omitted in a PUT request, the existing secret value will be
        #   left intact, not replaced with null.
        secret: nil,
        type: nil,
        request_options: {}
      )
      end

      # Get an ai_secret object by its id
      sig do
        params(
          ai_secret_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def retrieve(
        # AiSecret id
        ai_secret_id,
        request_options: {}
      )
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def update(
        # AiSecret id
        ai_secret_id,
        metadata: nil,
        # Name of the AI secret
        name: nil,
        secret: nil,
        type: nil,
        request_options: {}
      )
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::AISecret])
      end
      def list(
        # Name of the ai_secret to search for
        ai_secret_name: nil,
        ai_secret_type: nil,
        # Pagination cursor id.
        #
        #   For example, if the initial item in the last page you fetched had an id of
        #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        #   pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        #   IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete an ai_secret object by its id
      sig do
        params(
          ai_secret_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def delete(
        # AiSecret id
        ai_secret_id,
        request_options: {}
      )
      end

      # Delete a single ai_secret
      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def find_and_delete(
        # Name of the AI secret
        name:,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the AI Secret belongs in.
        org_name: nil,
        request_options: {}
      )
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def replace(
        # Name of the AI secret
        name:,
        metadata: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the AI Secret belongs in.
        org_name: nil,
        # Secret value. If omitted in a PUT request, the existing secret value will be
        #   left intact, not replaced with null.
        secret: nil,
        type: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
