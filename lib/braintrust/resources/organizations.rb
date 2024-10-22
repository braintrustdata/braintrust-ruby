# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      # @return [Braintrust::Resources::Organizations::Members]
      attr_reader :members

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
        @members = Braintrust::Resources::Organizations::Members.new(client: client)
      end

      # Get an organization object by its id
      #
      # @param organization_id [String] Organization id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Organization]
      def retrieve(organization_id, opts = {})
        req = {
          method: :get,
          path: "/v1/organization/#{organization_id}",
          model: Braintrust::Models::Organization
        }
        @client.request(req, opts)
      end

      # Partially update an organization object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param organization_id [String] Organization id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :api_url
      #   @option params [Boolean, nil] :is_universal_api
      #   @option params [String, nil] :name Name of the organization
      #   @option params [String, nil] :proxy_url
      #   @option params [String, nil] :realtime_url
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Organization]
      def update(organization_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/organization/#{organization_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Organization
        }
        @client.request(req, opts)
      end

      # List out all organizations. The organizations are sorted by creation date, with
      #   the most recently-created organizations coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Organization>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/organization",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Organization
        }
        @client.request(req, opts)
      end

      # Delete an organization object by its id
      #
      # @param organization_id [String] Organization id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Organization]
      def delete(organization_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/organization/#{organization_id}",
          model: Braintrust::Models::Organization
        }
        @client.request(req, opts)
      end
    end
  end
end
