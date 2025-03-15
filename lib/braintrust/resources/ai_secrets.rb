# frozen_string_literal: true

module Braintrust
  module Resources
    class AISecrets
      # Create a new ai_secret. If there is an existing ai_secret with the same name as
      #   the one specified in the request, will return the existing ai_secret unmodified
      #
      # @param params [Braintrust::Models::AISecretCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the AI secret
      #
      #   @option params [Hash{Symbol=>Object, nil}, nil] :metadata
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #
      #   @option params [String, nil] :secret Secret value. If omitted in a PUT request, the existing secret value will be
      #     left intact, not replaced with null.
      #
      #   @option params [String, nil] :type
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::AISecret]
      def create(params)
        parsed, options = Braintrust::Models::AISecretCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/ai_secret",
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # Get an ai_secret object by its id
      #
      # @param ai_secret_id [String] AiSecret id
      #
      # @param params [Braintrust::Models::AISecretRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::AISecret]
      def retrieve(ai_secret_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/ai_secret/%0s", ai_secret_id],
          model: Braintrust::Models::AISecret,
          options: params[:request_options]
        )
      end

      # Partially update an ai_secret object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param ai_secret_id [String] AiSecret id
      #
      # @param params [Braintrust::Models::AISecretUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Hash{Symbol=>Object, nil}, nil] :metadata
      #
      #   @option params [String, nil] :name Name of the AI secret
      #
      #   @option params [String, nil] :secret
      #
      #   @option params [String, nil] :type
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::AISecret]
      def update(ai_secret_id, params = {})
        parsed, options = Braintrust::Models::AISecretUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/ai_secret/%0s", ai_secret_id],
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # List out all ai_secrets. The ai_secrets are sorted by creation date, with the
      #   most recently-created ai_secrets coming first
      #
      # @param params [Braintrust::Models::AISecretListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :ai_secret_name Name of the ai_secret to search for
      #
      #   @option params [String, Array<String>] :ai_secret_type
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :org_name Filter search results to within a particular organization
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::AISecret>]
      def list(params = {})
        parsed, options = Braintrust::Models::AISecretListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/ai_secret",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # Delete an ai_secret object by its id
      #
      # @param ai_secret_id [String] AiSecret id
      #
      # @param params [Braintrust::Models::AISecretDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::AISecret]
      def delete(ai_secret_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/ai_secret/%0s", ai_secret_id],
          model: Braintrust::Models::AISecret,
          options: params[:request_options]
        )
      end

      # Delete a single ai_secret
      #
      # @param params [Braintrust::Models::AISecretFindAndDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the AI secret
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::AISecret]
      def find_and_delete(params)
        parsed, options = Braintrust::Models::AISecretFindAndDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: "v1/ai_secret",
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # Create or replace ai_secret. If there is an existing ai_secret with the same
      #   name as the one specified in the request, will replace the existing ai_secret
      #   with the provided fields
      #
      # @param params [Braintrust::Models::AISecretReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the AI secret
      #
      #   @option params [Hash{Symbol=>Object, nil}, nil] :metadata
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #
      #   @option params [String, nil] :secret Secret value. If omitted in a PUT request, the existing secret value will be
      #     left intact, not replaced with null.
      #
      #   @option params [String, nil] :type
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::AISecret]
      def replace(params)
        parsed, options = Braintrust::Models::AISecretReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/ai_secret",
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
