# typed: strong

module Braintrust
  module Resources
    class Roles
      # Create a new role. If there is an existing role with the same name as the one
      #   specified in the request, will return the existing role unmodified
      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def create(
        # Name of the role
        name:,
        # Textual description of the role
        description: nil,
        # (permission, restrict_object_type) tuples which belong to this role
        member_permissions: nil,
        # Ids of the roles this role inherits from
        #
        #   An inheriting role has all the permissions contained in its member roles, as
        #   well as all of their inherited permissions
        member_roles: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the role belongs in.
        org_name: nil,
        request_options: {}
      )
      end

      # Get a role object by its id
      sig do
        params(
          role_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def retrieve(
        # Role id
        role_id,
        request_options: {}
      )
      end

      # Partially update a role object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      sig do
        params(
          role_id: String,
          add_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]),
          add_member_roles: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]),
          remove_member_roles: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def update(
        # Role id
        role_id,
        # A list of permissions to add to the role
        add_member_permissions: nil,
        # A list of role IDs to add to the role's inheriting-from set
        add_member_roles: nil,
        # Textual description of the role
        description: nil,
        # Name of the role
        name: nil,
        # A list of permissions to remove from the role
        remove_member_permissions: nil,
        # A list of role IDs to remove from the role's inheriting-from set
        remove_member_roles: nil,
        request_options: {}
      )
      end

      # List out all roles. The roles are sorted by creation date, with the most
      #   recently-created roles coming first
      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          role_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Role])
      end
      def list(
        # Pagination cursor id.
        #
        #   For example, if the initial item in the last page you fetched had an id of
        #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        #   pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        #   IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Name of the role to search for
        role_name: nil,
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete a role object by its id
      sig do
        params(
          role_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def delete(
        # Role id
        role_id,
        request_options: {}
      )
      end

      # Create or replace role. If there is an existing role with the same name as the
      #   one specified in the request, will replace the existing role with the provided
      #   fields
      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def replace(
        # Name of the role
        name:,
        # Textual description of the role
        description: nil,
        # (permission, restrict_object_type) tuples which belong to this role
        member_permissions: nil,
        # Ids of the roles this role inherits from
        #
        #   An inheriting role has all the permissions contained in its member roles, as
        #   well as all of their inherited permissions
        member_roles: nil,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, you may specify the name of
        #   the organization the role belongs in.
        org_name: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
