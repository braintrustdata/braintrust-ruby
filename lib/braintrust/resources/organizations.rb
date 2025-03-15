# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      # @return [Braintrust::Resources::Organizations::Members]
      attr_reader :members

      # Get an organization object by its id
      #
      # @param organization_id [String] Organization id
      #
      # @param params [Braintrust::Models::OrganizationRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Organization]
      def retrieve(organization_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/organization/%0s", organization_id],
          model: Braintrust::Models::Organization,
          options: params[:request_options]
        )
      end

      # Partially update an organization object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param organization_id [String] Organization id
      #
      # @param params [Braintrust::Models::OrganizationUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :api_url
      #
      #   @option params [Boolean, nil] :is_universal_api
      #
      #   @option params [String, nil] :name Name of the organization
      #
      #   @option params [String, nil] :proxy_url
      #
      #   @option params [String, nil] :realtime_url
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Organization]
      def update(organization_id, params = {})
        parsed, options = Braintrust::Models::OrganizationUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/organization/%0s", organization_id],
          body: parsed,
          model: Braintrust::Models::Organization,
          options: options
        )
      end

      # List out all organizations. The organizations are sorted by creation date, with
      #   the most recently-created organizations coming first
      #
      # @param params [Braintrust::Models::OrganizationListParams, Hash{Symbol=>Object}] .
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
      # @return [Braintrust::ListObjects<Braintrust::Models::Organization>]
      def list(params = {})
        parsed, options = Braintrust::Models::OrganizationListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/organization",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Organization,
          options: options
        )
      end

      # Delete an organization object by its id
      #
      # @param organization_id [String] Organization id
      #
      # @param params [Braintrust::Models::OrganizationDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Organization]
      def delete(organization_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/organization/%0s", organization_id],
          model: Braintrust::Models::Organization,
          options: params[:request_options]
        )
      end

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
        @members = Braintrust::Resources::Organizations::Members.new(client: client)
      end
    end
  end
end
