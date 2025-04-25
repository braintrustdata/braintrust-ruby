# frozen_string_literal: true

module Braintrust
  module Resources
    class APIKeys
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::APIKeyCreateParams} for more details.
      #
      # Create a new api_key. It is possible to have multiple API keys with the same
      # name. There is no de-duplication
      #
      # @overload create(name:, org_name: nil, request_options: {})
      #
      # @param name [String] Name of the api key. Does not have to be unique
      #
      # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      # ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::CreateAPIKeyOutput]
      #
      # @see Braintrust::Models::APIKeyCreateParams
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
      # @overload retrieve(api_key_id, request_options: {})
      #
      # @param api_key_id [String] ApiKey id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::APIKey]
      #
      # @see Braintrust::Models::APIKeyRetrieveParams
      def retrieve(api_key_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/api_key/%1$s", api_key_id],
          model: Braintrust::Models::APIKey,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::APIKeyListParams} for more details.
      #
      # List out all api_keys. The api_keys are sorted by creation date, with the most
      # recently-created api_keys coming first
      #
      # @overload list(api_key_name: nil, ending_before: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param api_key_name [String] Name of the api_key to search for
      #
      # @param ending_before [String] Pagination cursor id. ...
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      # ...
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param starting_after [String] Pagination cursor id. ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::APIKey>]
      #
      # @see Braintrust::Models::APIKeyListParams
      def list(params = {})
        parsed, options = Braintrust::Models::APIKeyListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/api_key",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::APIKey,
          options: options
        )
      end

      # Delete an api_key object by its id
      #
      # @overload delete(api_key_id, request_options: {})
      #
      # @param api_key_id [String] ApiKey id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::APIKey]
      #
      # @see Braintrust::Models::APIKeyDeleteParams
      def delete(api_key_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/api_key/%1$s", api_key_id],
          model: Braintrust::Models::APIKey,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
