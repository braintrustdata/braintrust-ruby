# frozen_string_literal: true

module Braintrust
  module Resources
    class Group
      def initialize(client:)
        @client = client
      end

      # Create a new group. If there is an existing group with the same name as the one
      #   specified in the request, will return the existing group unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the group
      # @option params [String] :description Textual description of the group
      # @option params [Array<String>] :member_groups Ids of the groups this group inherits from
      # 
      #   An inheriting group has all the users contained in its member groups, as well as
      #   all of their inherited users
      # @option params [Array<String>] :member_users Ids of users which belong to this group
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the group belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::Group]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/group"
        req[:body] = params
        req[:model] = Braintrust::Models::Group
        @client.request(req, opts)
      end

      # Get a group object by its id
      # 
      # @param group_id [String] Group id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::Group]
      def retrieve(group_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/group/#{group_id}"
        req[:model] = Braintrust::Models::Group
        @client.request(req, opts)
      end

      # Partially update a group object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      # 
      # @param group_id [String] Group id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<String>] :add_member_groups A list of group IDs to add to the group's inheriting-from set
      # @option params [Array<String>] :add_member_users A list of user IDs to add to the group
      # @option params [String] :description Textual description of the group
      # @option params [String] :name Name of the group
      # @option params [Array<String>] :remove_member_groups A list of group IDs to remove from the group's inheriting-from set
      # @option params [Array<String>] :remove_member_users A list of user IDs to remove from the group
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::Group]
      def update(group_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/group/#{group_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::Group
        @client.request(req, opts)
      end

      # List out all groups. The groups are sorted by creation date, with the most
      #   recently-created groups coming first
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :ending_before Pagination cursor id.
      # 
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [String] :group_name Name of the group to search for
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
      # @return [Braintrust::ListObjects<Braintrust::Models::Group>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/group"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::Group
        @client.request(req, opts)
      end

      # Delete a group object by its id
      # 
      # @param group_id [String] Group id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::Group]
      def delete(group_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/group/#{group_id}"
        req[:model] = Braintrust::Models::Group
        @client.request(req, opts)
      end

      # Create or replace group. If there is an existing group with the same name as the
      #   one specified in the request, will replace the existing group with the provided
      #   fields
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the group
      # @option params [String] :description Textual description of the group
      # @option params [Array<String>] :member_groups Ids of the groups this group inherits from
      # 
      #   An inheriting group has all the users contained in its member groups, as well as
      #   all of their inherited users
      # @option params [Array<String>] :member_users Ids of users which belong to this group
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the group belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::Group]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/group"
        req[:body] = params
        req[:model] = Braintrust::Models::Group
        @client.request(req, opts)
      end
    end
  end
end
