# typed: strong

module Braintrust
  module Models
    class Role < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Braintrust::Role, Braintrust::Internal::AnyHash) }

      # Unique identifier for the role
      sig { returns(String) }
      attr_accessor :id

      # Name of the role
      sig { returns(String) }
      attr_accessor :name

      # Date of role creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of role deletion, or null if the role is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Textual description of the role
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # (permission, restrict_object_type) tuples which belong to this role
      sig { returns(T.nilable(T::Array[Braintrust::Role::MemberPermission])) }
      attr_accessor :member_permissions

      # Ids of the roles this role inherits from
      #
      # An inheriting role has all the permissions contained in its member roles, as
      # well as all of their inherited permissions
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :member_roles

      # Unique id for the organization that the role belongs under
      #
      # A null org_id indicates a system role, which may be assigned to anybody and
      # inherited by any other role, but cannot be edited.
      #
      # It is forbidden to change the org after creating a role
      sig { returns(T.nilable(String)) }
      attr_accessor :org_id

      # Identifies the user who created the role
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # A role is a collection of permissions which can be granted as part of an ACL
      #
      # Roles can consist of individual permissions, as well as a set of roles they
      # inherit from
      sig do
        params(
          id: String,
          name: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          member_permissions:
            T.nilable(T::Array[Braintrust::Role::MemberPermission::OrHash]),
          member_roles: T.nilable(T::Array[String]),
          org_id: T.nilable(String),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the role
        id:,
        # Name of the role
        name:,
        # Date of role creation
        created: nil,
        # Date of role deletion, or null if the role is still active
        deleted_at: nil,
        # Textual description of the role
        description: nil,
        # (permission, restrict_object_type) tuples which belong to this role
        member_permissions: nil,
        # Ids of the roles this role inherits from
        #
        # An inheriting role has all the permissions contained in its member roles, as
        # well as all of their inherited permissions
        member_roles: nil,
        # Unique id for the organization that the role belongs under
        #
        # A null org_id indicates a system role, which may be assigned to anybody and
        # inherited by any other role, but cannot be edited.
        #
        # It is forbidden to change the org after creating a role
        org_id: nil,
        # Identifies the user who created the role
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            created: T.nilable(Time),
            deleted_at: T.nilable(Time),
            description: T.nilable(String),
            member_permissions:
              T.nilable(T::Array[Braintrust::Role::MemberPermission]),
            member_roles: T.nilable(T::Array[String]),
            org_id: T.nilable(String),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class MemberPermission < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Braintrust::Role::MemberPermission,
              Braintrust::Internal::AnyHash
            )
          end

        # Each permission permits a certain type of operation on an object in the system
        #
        # Permissions can be assigned to to objects on an individual basis, or grouped
        # into roles
        sig { returns(Braintrust::Permission::TaggedSymbol) }
        attr_accessor :permission

        # The object type that the ACL applies to
        sig { returns(T.nilable(Braintrust::ACLObjectType::TaggedSymbol)) }
        attr_accessor :restrict_object_type

        sig do
          params(
            permission: Braintrust::Permission::OrSymbol,
            restrict_object_type: T.nilable(Braintrust::ACLObjectType::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          # Each permission permits a certain type of operation on an object in the system
          #
          # Permissions can be assigned to to objects on an individual basis, or grouped
          # into roles
          permission:,
          # The object type that the ACL applies to
          restrict_object_type: nil
        )
        end

        sig do
          override.returns(
            {
              permission: Braintrust::Permission::TaggedSymbol,
              restrict_object_type:
                T.nilable(Braintrust::ACLObjectType::TaggedSymbol)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
