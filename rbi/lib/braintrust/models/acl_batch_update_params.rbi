# typed: strong

module Braintrust
  module Models
    class ACLBatchUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      sig { returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL])) }
      def add_acls
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]))
          .returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]))
      end
      def add_acls=(_)
      end

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
      sig { returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL])) }
      def remove_acls
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]))
          .returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]))
      end
      def remove_acls=(_)
      end

      sig do
        params(
          add_acls: T.nilable(T::Array[T.any(Braintrust::Models::ACLBatchUpdateParams::AddACL, Braintrust::Util::AnyHash)]),
          remove_acls: T.nilable(T::Array[T.any(Braintrust::Models::ACLBatchUpdateParams::RemoveACL, Braintrust::Util::AnyHash)]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(add_acls: nil, remove_acls: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              add_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]),
              remove_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class AddACL < Braintrust::BaseModel
        # The id of the object the ACL applies to
        sig { returns(String) }
        def object_id_
        end

        sig { params(_: String).returns(String) }
        def object_id_=(_)
        end

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
        def object_type
        end

        sig do
          params(_: Braintrust::Models::ACLObjectType::OrSymbol).returns(Braintrust::Models::ACLObjectType::OrSymbol)
        end
        def object_type=(_)
        end

        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        def group_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def group_id=(_)
        end

        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(Braintrust::Models::Permission::OrSymbol)) }
        def permission
        end

        sig do
          params(_: T.nilable(Braintrust::Models::Permission::OrSymbol))
            .returns(T.nilable(Braintrust::Models::Permission::OrSymbol))
        end
        def permission=(_)
        end

        # When setting a permission directly, optionally restricts the permission grant to
        #   just the specified object type. Cannot be set alongside a `role_id`.
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        def restrict_object_type
        end

        sig do
          params(_: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol))
            .returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol))
        end
        def restrict_object_type=(_)
        end

        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(String)) }
        def role_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def role_id=(_)
        end

        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        def user_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def user_id=(_)
        end

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
        sig do
          params(
            object_id_: String,
            object_type: Braintrust::Models::ACLObjectType::OrSymbol,
            group_id: T.nilable(String),
            permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
            restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
            role_id: T.nilable(String),
            user_id: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(
          object_id_:,
          object_type:,
          group_id: nil,
          permission: nil,
          restrict_object_type: nil,
          role_id: nil,
          user_id: nil
        )
        end

        sig do
          override
            .returns(
              {
                object_id_: String,
                object_type: Braintrust::Models::ACLObjectType::OrSymbol,
                group_id: T.nilable(String),
                permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
                restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
                role_id: T.nilable(String),
                user_id: T.nilable(String)
              }
            )
        end
        def to_hash
        end
      end

      class RemoveACL < Braintrust::BaseModel
        # The id of the object the ACL applies to
        sig { returns(String) }
        def object_id_
        end

        sig { params(_: String).returns(String) }
        def object_id_=(_)
        end

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
        def object_type
        end

        sig do
          params(_: Braintrust::Models::ACLObjectType::OrSymbol).returns(Braintrust::Models::ACLObjectType::OrSymbol)
        end
        def object_type=(_)
        end

        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        def group_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def group_id=(_)
        end

        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(Braintrust::Models::Permission::OrSymbol)) }
        def permission
        end

        sig do
          params(_: T.nilable(Braintrust::Models::Permission::OrSymbol))
            .returns(T.nilable(Braintrust::Models::Permission::OrSymbol))
        end
        def permission=(_)
        end

        # When setting a permission directly, optionally restricts the permission grant to
        #   just the specified object type. Cannot be set alongside a `role_id`.
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        def restrict_object_type
        end

        sig do
          params(_: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol))
            .returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol))
        end
        def restrict_object_type=(_)
        end

        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(String)) }
        def role_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def role_id=(_)
        end

        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        def user_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def user_id=(_)
        end

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
        sig do
          params(
            object_id_: String,
            object_type: Braintrust::Models::ACLObjectType::OrSymbol,
            group_id: T.nilable(String),
            permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
            restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
            role_id: T.nilable(String),
            user_id: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(
          object_id_:,
          object_type:,
          group_id: nil,
          permission: nil,
          restrict_object_type: nil,
          role_id: nil,
          user_id: nil
        )
        end

        sig do
          override
            .returns(
              {
                object_id_: String,
                object_type: Braintrust::Models::ACLObjectType::OrSymbol,
                group_id: T.nilable(String),
                permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
                restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
                role_id: T.nilable(String),
                user_id: T.nilable(String)
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
