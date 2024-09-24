# frozen_string_literal: true

module Braintrust
  module Resources
    class APIKeys
      def initialize(client:)
        @client = client
      end

      # Create a new api_key. It is possible to have multiple API keys with the same
      #   name. There is no de-duplication
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the api key. Does not have to be unique
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the API key belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::CreateAPIKeyOutput]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/api_key"
        req[:body] = params
        req[:model] = Braintrust::Models::CreateAPIKeyOutput
        @client.request(req, opts)
      end

      # Get an api_key object by its id
      # 
      # @param api_key_id [String] ApiKey id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::APIKey]
      def retrieve(api_key_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/api_key/#{api_key_id}"
        req[:model] = Braintrust::Models::APIKey
        @client.request(req, opts)
      end

      # List out all api_keys. The api_keys are sorted by creation date, with the most
      #   recently-created api_keys coming first
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :api_key_name Name of the api_key to search for
      # @option params [String] :ending_before Pagination cursor id.
      # 
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :org_name Filter search results to within a particular organization
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::ListObjects<Braintrust::Models::APIKey>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/api_key"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::APIKey
        @client.request(req, opts)
      end

      # Delete an api_key object by its id
      # 
      # @param api_key_id [String] ApiKey id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::APIKey]
      def delete(api_key_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/api_key/#{api_key_id}"
        req[:model] = Braintrust::Models::APIKey
        @client.request(req, opts)
      end
    end
  end
end
