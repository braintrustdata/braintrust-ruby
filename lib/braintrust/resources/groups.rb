# frozen_string_literal: true

module Braintrust
  module Resources
    class Groups
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::GroupCreateParams} for more details.
      #
      # Create a new group. If there is an existing group with the same name as the one
      # specified in the request, will return the existing group unmodified
      #
      # @overload create(name:, description: nil, member_groups: nil, member_users: nil, org_name: nil, request_options: {})
      #
      # @param name [String] Name of the group
      #
      # @param description [String, nil] Textual description of the group
      #
      # @param member_groups [Array<String>, nil] Ids of the groups this group inherits from
      #
      # @param member_users [Array<String>, nil] Ids of users which belong to this group
      #
      # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupCreateParams
      def create(params)
        parsed, options = Braintrust::GroupCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/group",
          body: parsed,
          model: Braintrust::Group,
          options: options
        )
      end

      # Get a group object by its id
      #
      # @overload retrieve(group_id, request_options: {})
      #
      # @param group_id [String] Group id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupRetrieveParams
      def retrieve(group_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/group/%1$s", group_id],
          model: Braintrust::Group,
          options: params[:request_options]
        )
      end

      # Partially update a group object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      #
      # @overload update(group_id, add_member_groups: nil, add_member_users: nil, description: nil, name: nil, remove_member_groups: nil, remove_member_users: nil, request_options: {})
      #
      # @param group_id [String] Group id
      #
      # @param add_member_groups [Array<String>, nil] A list of group IDs to add to the group's inheriting-from set
      #
      # @param add_member_users [Array<String>, nil] A list of user IDs to add to the group
      #
      # @param description [String, nil] Textual description of the group
      #
      # @param name [String, nil] Name of the group
      #
      # @param remove_member_groups [Array<String>, nil] A list of group IDs to remove from the group's inheriting-from set
      #
      # @param remove_member_users [Array<String>, nil] A list of user IDs to remove from the group
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupUpdateParams
      def update(group_id, params = {})
        parsed, options = Braintrust::GroupUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/group/%1$s", group_id],
          body: parsed,
          model: Braintrust::Group,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::GroupListParams} for more details.
      #
      # List out all groups. The groups are sorted by creation date, with the most
      # recently-created groups coming first
      #
      # @overload list(ending_before: nil, group_name: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param group_name [String] Name of the group to search for
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
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Group>]
      #
      # @see Braintrust::Models::GroupListParams
      def list(params = {})
        parsed, options = Braintrust::GroupListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/group",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Group,
          options: options
        )
      end

      # Delete a group object by its id
      #
      # @overload delete(group_id, request_options: {})
      #
      # @param group_id [String] Group id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupDeleteParams
      def delete(group_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/group/%1$s", group_id],
          model: Braintrust::Group,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::GroupReplaceParams} for more details.
      #
      # Create or replace group. If there is an existing group with the same name as the
      # one specified in the request, will replace the existing group with the provided
      # fields
      #
      # @overload replace(name:, description: nil, member_groups: nil, member_users: nil, org_name: nil, request_options: {})
      #
      # @param name [String] Name of the group
      #
      # @param description [String, nil] Textual description of the group
      #
      # @param member_groups [Array<String>, nil] Ids of the groups this group inherits from
      #
      # @param member_users [Array<String>, nil] Ids of users which belong to this group
      #
      # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Group]
      #
      # @see Braintrust::Models::GroupReplaceParams
      def replace(params)
        parsed, options = Braintrust::GroupReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/group",
          body: parsed,
          model: Braintrust::Group,
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
