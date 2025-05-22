# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      # @return [Braintrust::Resources::Organizations::Members]
      attr_reader :members

      # Get an organization object by its id
      #
      # @overload retrieve(organization_id, request_options: {})
      #
      # @param organization_id [String] Organization id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Organization]
      #
      # @see Braintrust::Models::OrganizationRetrieveParams
      def retrieve(organization_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/organization/%1$s", organization_id],
          model: Braintrust::Organization,
          options: params[:request_options]
        )
      end

      # Partially update an organization object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      #
      # @overload update(organization_id, api_url: nil, is_universal_api: nil, name: nil, proxy_url: nil, realtime_url: nil, request_options: {})
      #
      # @param organization_id [String] Organization id
      #
      # @param api_url [String, nil]
      #
      # @param is_universal_api [Boolean, nil]
      #
      # @param name [String, nil] Name of the organization
      #
      # @param proxy_url [String, nil]
      #
      # @param realtime_url [String, nil]
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Organization]
      #
      # @see Braintrust::Models::OrganizationUpdateParams
      def update(organization_id, params = {})
        parsed, options = Braintrust::OrganizationUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/organization/%1$s", organization_id],
          body: parsed,
          model: Braintrust::Organization,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::OrganizationListParams} for more details.
      #
      # List out all organizations. The organizations are sorted by creation date, with
      # the most recently-created organizations coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Organization>]
      #
      # @see Braintrust::Models::OrganizationListParams
      def list(params = {})
        parsed, options = Braintrust::OrganizationListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/organization",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Organization,
          options: options
        )
      end

      # Delete an organization object by its id
      #
      # @overload delete(organization_id, request_options: {})
      #
      # @param organization_id [String] Organization id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Organization]
      #
      # @see Braintrust::Models::OrganizationDeleteParams
      def delete(organization_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/organization/%1$s", organization_id],
          model: Braintrust::Organization,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
        @members = Braintrust::Resources::Organizations::Members.new(client: client)
      end
    end
  end
end
