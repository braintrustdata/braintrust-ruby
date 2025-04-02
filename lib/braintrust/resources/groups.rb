# frozen_string_literal: true

module Braintrust
  module Resources
    class Groups
      # Create a new group. If there is an existing group with the same name as the one
      #   specified in the request, will return the existing group unmodified
      #
      # @param params [Braintrust::Models::GroupCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the group
      #
      #   @option params [String, nil] :description Textual description of the group
      #
      #   @option params [Array<String>, nil] :member_groups Ids of the groups this group inherits from
      #
      #     An inheriting group has all the users contained in its member groups, as well as
      #     all of their inherited users
      #
      #   @option params [Array<String>, nil] :member_users Ids of users which belong to this group
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the group belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupCreateParams
      def create(params)
        parsed, options = Braintrust::Models::GroupCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/group",
          body: parsed,
          model: Braintrust::Models::Group,
          options: options
        )
      end

      # Get a group object by its id
      #
      # @param group_id [String] Group id
      #
      # @param params [Braintrust::Models::GroupRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupRetrieveParams
      def retrieve(group_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/group/%1$s", group_id],
          model: Braintrust::Models::Group,
          options: params[:request_options]
        )
      end

      # Partially update a group object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param group_id [String] Group id
      #
      # @param params [Braintrust::Models::GroupUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<String>, nil] :add_member_groups A list of group IDs to add to the group's inheriting-from set
      #
      #   @option params [Array<String>, nil] :add_member_users A list of user IDs to add to the group
      #
      #   @option params [String, nil] :description Textual description of the group
      #
      #   @option params [String, nil] :name Name of the group
      #
      #   @option params [Array<String>, nil] :remove_member_groups A list of group IDs to remove from the group's inheriting-from set
      #
      #   @option params [Array<String>, nil] :remove_member_users A list of user IDs to remove from the group
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupUpdateParams
      def update(group_id, params = {})
        parsed, options = Braintrust::Models::GroupUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/group/%1$s", group_id],
          body: parsed,
          model: Braintrust::Models::Group,
          options: options
        )
      end

      # List out all groups. The groups are sorted by creation date, with the most
      #   recently-created groups coming first
      #
      # @param params [Braintrust::Models::GroupListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String] :group_name Name of the group to search for
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
      # @return [Braintrust::ListObjects<Braintrust::Models::Group>]
      #
      # @see Braintrust::Models::GroupListParams
      def list(params = {})
        parsed, options = Braintrust::Models::GroupListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/group",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Group,
          options: options
        )
      end

      # Delete a group object by its id
      #
      # @param group_id [String] Group id
      #
      # @param params [Braintrust::Models::GroupDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupDeleteParams
      def delete(group_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/group/%1$s", group_id],
          model: Braintrust::Models::Group,
          options: params[:request_options]
        )
      end

      # Create or replace group. If there is an existing group with the same name as the
      #   one specified in the request, will replace the existing group with the provided
      #   fields
      #
      # @param params [Braintrust::Models::GroupReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the group
      #
      #   @option params [String, nil] :description Textual description of the group
      #
      #   @option params [Array<String>, nil] :member_groups Ids of the groups this group inherits from
      #
      #     An inheriting group has all the users contained in its member groups, as well as
      #     all of their inherited users
      #
      #   @option params [Array<String>, nil] :member_users Ids of users which belong to this group
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the group belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::GroupReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/group",
          body: parsed,
          model: Braintrust::Models::Group,
          options: options
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
