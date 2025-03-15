# typed: strong

module Braintrust
  module Models
    class Role < Braintrust::BaseModel
      # Unique identifier for the role
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the role
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Date of role creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Date of role deletion, or null if the role is still active
      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      # Textual description of the role
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # (permission, restrict_object_type) tuples which belong to this role
      sig { returns(T.nilable(T::Array[Braintrust::Models::Role::MemberPermission])) }
      def member_permissions
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]))
          .returns(T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]))
      end
      def member_permissions=(_)
      end

      # Ids of the roles this role inherits from
      #
      #   An inheriting role has all the permissions contained in its member roles, as
      #   well as all of their inherited permissions
      sig { returns(T.nilable(T::Array[String])) }
      def member_roles
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def member_roles=(_)
      end

      # Unique id for the organization that the role belongs under
      #
      #   A null org_id indicates a system role, which may be assigned to anybody and
      #   inherited by any other role, but cannot be edited.
      #
      #   It is forbidden to change the org after creating a role
      sig { returns(T.nilable(String)) }
      def org_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_id=(_)
      end

      # Identifies the user who created the role
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      # A role is a collection of permissions which can be granted as part of an ACL
      #
      #   Roles can consist of individual permissions, as well as a set of roles they
      #   inherit from
      sig do
        params(
          id: String,
          name: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        created: nil,
        deleted_at: nil,
        description: nil,
        member_permissions: nil,
        member_roles: nil,
        org_id: nil,
        user_id: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              created: T.nilable(Time),
              deleted_at: T.nilable(Time),
              description: T.nilable(String),
              member_permissions: T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]),
              member_roles: T.nilable(T::Array[String]),
              org_id: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      class MemberPermission < Braintrust::BaseModel
        # Each permission permits a certain type of operation on an object in the system
        #
        #   Permissions can be assigned to to objects on an individual basis, or grouped
        #   into roles
        sig { returns(Symbol) }
        def permission
        end

        sig { params(_: Symbol).returns(Symbol) }
        def permission=(_)
        end

        # The object type that the ACL applies to
        sig { returns(T.nilable(Symbol)) }
        def restrict_object_type
        end

        sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
        def restrict_object_type=(_)
        end

        sig { params(permission: Symbol, restrict_object_type: T.nilable(Symbol)).returns(T.attached_class) }
        def self.new(permission:, restrict_object_type: nil)
        end

        sig { override.returns({permission: Symbol, restrict_object_type: T.nilable(Symbol)}) }
        def to_hash
        end
      end
    end
  end
end
