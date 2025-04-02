# frozen_string_literal: true

module Braintrust
  module Resources
    class Groups
      # Create a new group. If there is an existing group with the same name as the one
      #   specified in the request, will return the existing group unmodified
      #
      # @overload create(name:, description: nil, member_groups: nil, member_users: nil, org_name: nil, request_options: {})
      #
      # @param name [String]
      # @param description [String, nil]
      # @param member_groups [Array<String>, nil]
      # @param member_users [Array<String>, nil]
      # @param org_name [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload retrieve(group_id, request_options: {})
      #
      # @param group_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload update(group_id, add_member_groups: nil, add_member_users: nil, description: nil, name: nil, remove_member_groups: nil, remove_member_users: nil, request_options: {})
      #
      # @param group_id [String]
      # @param add_member_groups [Array<String>, nil]
      # @param add_member_users [Array<String>, nil]
      # @param description [String, nil]
      # @param name [String, nil]
      # @param remove_member_groups [Array<String>, nil]
      # @param remove_member_users [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload list(ending_before: nil, group_name: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String]
      # @param group_name [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload delete(group_id, request_options: {})
      #
      # @param group_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload replace(name:, description: nil, member_groups: nil, member_users: nil, org_name: nil, request_options: {})
      #
      # @param name [String]
      # @param description [String, nil]
      # @param member_groups [Array<String>, nil]
      # @param member_users [Array<String>, nil]
      # @param org_name [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
