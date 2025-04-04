# typed: strong

module Braintrust
  module Models
    class ACLBatchUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      attr_accessor :add_acls

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
      attr_accessor :remove_acls

      sig do
        params(
          add_acls: T.nilable(
            T::Array[T.any(Braintrust::Models::ACLBatchUpdateParams::AddACL, Braintrust::Internal::AnyHash)]
          ),
          remove_acls: T.nilable(
            T::Array[T.any(Braintrust::Models::ACLBatchUpdateParams::RemoveACL, Braintrust::Internal::AnyHash)]
          ),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
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

      class AddACL < Braintrust::Internal::Type::BaseModel
        # The id of the object the ACL applies to
        sig { returns(String) }
        attr_accessor :object_id_

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
        attr_accessor :object_type

        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        attr_accessor :group_id

        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(Braintrust::Models::Permission::OrSymbol)) }
        attr_accessor :permission

        # When setting a permission directly, optionally restricts the permission grant to
        #   just the specified object type. Cannot be set alongside a `role_id`.
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        attr_accessor :restrict_object_type

        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(String)) }
        attr_accessor :role_id

        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

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

      class RemoveACL < Braintrust::Internal::Type::BaseModel
        # The id of the object the ACL applies to
        sig { returns(String) }
        attr_accessor :object_id_

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
        attr_accessor :object_type

        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        attr_accessor :group_id

        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(Braintrust::Models::Permission::OrSymbol)) }
        attr_accessor :permission

        # When setting a permission directly, optionally restricts the permission grant to
        #   just the specified object type. Cannot be set alongside a `role_id`.
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        attr_accessor :restrict_object_type

        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        #   provided
        sig { returns(T.nilable(String)) }
        attr_accessor :role_id

        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        #   be provided
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

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
