# frozen_string_literal: true

module Braintrust
  module Resources
    class APIKeys
      # Create a new api_key. It is possible to have multiple API keys with the same
      #   name. There is no de-duplication
      #
      # @param params [Braintrust::Models::APIKeyCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the api key. Does not have to be unique
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the API key belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::CreateAPIKeyOutput]
      def create(params)
        parsed, options = Braintrust::Models::APIKeyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/api_key",
          body: parsed,
          model: Braintrust::Models::CreateAPIKeyOutput,
          options: options
        )
      end

      # Get an api_key object by its id
      #
      # @param api_key_id [String] ApiKey id
      #
      # @param params [Braintrust::Models::APIKeyRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::APIKey]
      def retrieve(api_key_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/api_key/%1$s", api_key_id],
          model: Braintrust::Models::APIKey,
          options: params[:request_options]
        )
      end

      # List out all api_keys. The api_keys are sorted by creation date, with the most
      #   recently-created api_keys coming first
      #
      # @param params [Braintrust::Models::APIKeyListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :api_key_name Name of the api_key to search for
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
      # @return [Braintrust::ListObjects<Braintrust::Models::APIKey>]
      def list(params = {})
        parsed, options = Braintrust::Models::APIKeyListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/api_key",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::APIKey,
          options: options
        )
      end

      # Delete an api_key object by its id
      #
      # @param api_key_id [String] ApiKey id
      #
      # @param params [Braintrust::Models::APIKeyDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::APIKey]
      def delete(api_key_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/api_key/%1$s", api_key_id],
          model: Braintrust::Models::APIKey,
          options: params[:request_options]
        )
      end

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
