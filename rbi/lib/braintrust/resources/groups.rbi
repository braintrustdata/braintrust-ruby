# typed: strong

module Braintrust
  module Resources
    class Groups
      # Create a new group. If there is an existing group with the same name as the one
      #   specified in the request, will return the existing group unmodified
      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Group)
      end
      def create(
        # Name of the group
        name:,
        # Textual description of the group
        description: nil,
        # Ids of the groups this group inherits from
        #
        #   An inheriting group has all the users contained in its member groups, as well as
        #   all of their inherited users
        member_groups: nil,
        # Ids of users which belong to this group
        member_users: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the group belongs in.
        org_name: nil,
        request_options: {}
      )
      end

      # Get a group object by its id
      sig do
        params(
          group_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Group)
      end
      def retrieve(
        # Group id
        group_id,
        request_options: {}
      )
      end

      # Partially update a group object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      sig do
        params(
          group_id: String,
          add_member_groups: T.nilable(T::Array[String]),
          add_member_users: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_groups: T.nilable(T::Array[String]),
          remove_member_users: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Group)
      end
      def update(
        # Group id
        group_id,
        # A list of group IDs to add to the group's inheriting-from set
        add_member_groups: nil,
        # A list of user IDs to add to the group
        add_member_users: nil,
        # Textual description of the group
        description: nil,
        # Name of the group
        name: nil,
        # A list of group IDs to remove from the group's inheriting-from set
        remove_member_groups: nil,
        # A list of user IDs to remove from the group
        remove_member_users: nil,
        request_options: {}
      )
      end

      # List out all groups. The groups are sorted by creation date, with the most
      #   recently-created groups coming first
      sig do
        params(
          ending_before: String,
          group_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::Group])
      end
      def list(
        # Pagination cursor id.
        #
        #   For example, if the initial item in the last page you fetched had an id of
        #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        #   pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Name of the group to search for
        group_name: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        #   IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete a group object by its id
      sig do
        params(
          group_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Group)
      end
      def delete(
        # Group id
        group_id,
        request_options: {}
      )
      end

      # Create or replace group. If there is an existing group with the same name as the
      #   one specified in the request, will replace the existing group with the provided
      #   fields
      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Group)
      end
      def replace(
        # Name of the group
        name:,
        # Textual description of the group
        description: nil,
        # Ids of the groups this group inherits from
        #
        #   An inheriting group has all the users contained in its member groups, as well as
        #   all of their inherited users
        member_groups: nil,
        # Ids of users which belong to this group
        member_users: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the group belongs in.
        org_name: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
