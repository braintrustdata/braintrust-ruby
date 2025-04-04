# typed: strong

module Braintrust
  module Resources
    class ACLs
      # Create a new acl. If there is an existing acl with the same contents as the one
      #   specified in the request, will return the existing acl unmodified
      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          group_id: T.nilable(String),
          permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
          restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::ACL)
      end
      def create(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        group_id: nil,
        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        permission: nil,
        # When setting a permission directly, optionally restricts the permission grant to
        #   just the specified object type. Cannot be set alongside a `role_id`.
        restrict_object_type: nil,
        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        role_id: nil,
        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        user_id: nil,
        request_options: {}
      )
      end

      # Get an acl object by its id
      sig do
        params(
          acl_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::ACL)
      end
      def retrieve(
        # Acl id
        acl_id,
        request_options: {}
      )
      end

      # List out all acls. The acls are sorted by creation date, with the most
      #   recently-created acls coming first
      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::ACL])
      end
      def list(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
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
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete an acl object by its id
      sig do
        params(
          acl_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::ACL)
      end
      def delete(
        # Acl id
        acl_id,
        request_options: {}
      )
      end

      # Batch update acls. This operation is idempotent, so adding acls which already
      #   exist will have no effect, and removing acls which do not exist will have no
      #   effect.
      sig do
        params(
          add_acls: T.nilable(
            T::Array[T.any(Braintrust::Models::ACLBatchUpdateParams::AddACL, Braintrust::Internal::Util::AnyHash)]
          ),
          remove_acls: T.nilable(
            T::Array[T.any(Braintrust::Models::ACLBatchUpdateParams::RemoveACL, Braintrust::Internal::Util::AnyHash)]
          ),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::ACLBatchUpdateResponse)
      end
      def batch_update(
        # An ACL grants a certain permission or role to a certain user or group on an
        #   object.
        #
        #   ACLs are inherited across the object hierarchy. So for example, if a user has
        #   read permissions on a project, they will also have read permissions on any
        #   experiment, dataset, etc. created within that project.
        #
        #   To restrict a grant to a particular sub-object, you may specify
        #   `restrict_object_type` in the ACL, as part of a direct permission grant or as
        #   part of a role.
        add_acls: nil,
        # An ACL grants a certain permission or role to a certain user or group on an
        #   object.
        #
        #   ACLs are inherited across the object hierarchy. So for example, if a user has
        #   read permissions on a project, they will also have read permissions on any
        #   experiment, dataset, etc. created within that project.
        #
        #   To restrict a grant to a particular sub-object, you may specify
        #   `restrict_object_type` in the ACL, as part of a direct permission grant or as
        #   part of a role.
        remove_acls: nil,
        request_options: {}
      )
      end

      # Delete a single acl
      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          group_id: T.nilable(String),
          permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
          restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash))
        )
          .returns(Braintrust::Models::ACL)
      end
      def find_and_delete(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        group_id: nil,
        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        permission: nil,
        # When setting a permission directly, optionally restricts the permission grant to
        #   just the specified object type. Cannot be set alongside a `role_id`.
        restrict_object_type: nil,
        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        role_id: nil,
        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        user_id: nil,
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
