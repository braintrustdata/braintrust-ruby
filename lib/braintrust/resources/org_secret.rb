# frozen_string_literal: true

module Braintrust
  module Resources
    class OrgSecret
      def initialize(client:)
        @client = client
      end

      # Create a new org_secret. If there is an existing org_secret with the same name
      #   as the one specified in the request, will return the existing org_secret
      #   unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the org secret
      # @option params [Hash] :metadata
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the Org Secret belongs in.
      # @option params [String] :secret Secret value. If omitted in a PUT request, the existing secret value will be
      #   left intact, not replaced with null.
      # @option params [String] :type
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::OrgSecret]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/org_secret"
        req[:body] = params
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end

      # Get an org_secret object by its id
      # 
      # @param org_secret_id [String] OrgSecret id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::OrgSecret]
      def retrieve(org_secret_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/org_secret/#{org_secret_id}"
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end

      # Partially update an org_secret object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      # 
      # @param org_secret_id [String] OrgSecret id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Hash] :metadata
      # @option params [String] :name Name of the org secret
      # @option params [String] :secret
      # @option params [String] :type
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::OrgSecret]
      def update(org_secret_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/org_secret/#{org_secret_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end

      # List out all org_secrets. The org_secrets are sorted by creation date, with the
      #   most recently-created org_secrets coming first
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :ending_before Pagination cursor id.
      # 
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :org_name Filter search results to within a particular organization
      # @option params [String] :org_secret_name Name of the org_secret to search for
      # @option params [Array<String>|String] :org_secret_type
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::ListObjects<Braintrust::Models::OrgSecret>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/org_secret"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end

      # Delete an org_secret object by its id
      # 
      # @param org_secret_id [String] OrgSecret id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::OrgSecret]
      def delete(org_secret_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/org_secret/#{org_secret_id}"
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end

      # Delete a single org_secret
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the org secret
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the Org Secret belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::OrgSecret]
      def find_and_delete(params = {}, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/org_secret"
        req[:body] = params
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end

      # Create or replace org_secret. If there is an existing org_secret with the same
      #   name as the one specified in the request, will replace the existing org_secret
      #   with the provided fields
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the org secret
      # @option params [Hash] :metadata
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the Org Secret belongs in.
      # @option params [String] :secret Secret value. If omitted in a PUT request, the existing secret value will be
      #   left intact, not replaced with null.
      # @option params [String] :type
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::OrgSecret]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/org_secret"
        req[:body] = params
        req[:model] = Braintrust::Models::OrgSecret
        @client.request(req, opts)
      end
    end
  end
end
