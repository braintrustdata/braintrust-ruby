# typed: strong

module Braintrust
  module Models
    class RoleUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # A list of permissions to add to the role
      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission])) }
      attr_accessor :add_member_permissions

      # A list of role IDs to add to the role's inheriting-from set
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :add_member_roles

      # Textual description of the role
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the role
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # A list of permissions to remove from the role
      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission])) }
      attr_accessor :remove_member_permissions

      # A list of role IDs to remove from the role's inheriting-from set
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :remove_member_roles

      sig do
        params(
          add_member_permissions: T.nilable(
            T::Array[T.any(Braintrust::Models::RoleUpdateParams::AddMemberPermission, Braintrust::Internal::AnyHash)]
          ),
          add_member_roles: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_permissions: T.nilable(
            T::Array[T.any(Braintrust::Models::RoleUpdateParams::RemoveMemberPermission, Braintrust::Internal::AnyHash)]
          ),
          remove_member_roles: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
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
      ); end
      sig do
        override
          .returns(
            {
              add_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]),
              add_member_roles: T.nilable(T::Array[String]),
              description: T.nilable(String),
              name: T.nilable(String),
              remove_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]),
              remove_member_roles: T.nilable(T::Array[String]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end

      class AddMemberPermission < Braintrust::Internal::Type::BaseModel
        # Each permission permits a certain type of operation on an object in the system
        #
        # Permissions can be assigned to to objects on an individual basis, or grouped
        # into roles
        sig { returns(Braintrust::Models::Permission::OrSymbol) }
        attr_accessor :permission

        # The object type that the ACL applies to
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        attr_accessor :restrict_object_type

        sig do
          params(
            permission: Braintrust::Models::Permission::OrSymbol,
            restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)
          )
            .returns(T.attached_class)
        end
        def self.new(
          # Each permission permits a certain type of operation on an object in the system
          #
          # Permissions can be assigned to to objects on an individual basis, or grouped
          # into roles
          permission:,
          # The object type that the ACL applies to
          restrict_object_type: nil
        ); end
        sig do
          override
            .returns(
              {
                permission: Braintrust::Models::Permission::OrSymbol,
                restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)
              }
            )
        end
        def to_hash; end
      end

      class RemoveMemberPermission < Braintrust::Internal::Type::BaseModel
        # Each permission permits a certain type of operation on an object in the system
        #
        # Permissions can be assigned to to objects on an individual basis, or grouped
        # into roles
        sig { returns(Braintrust::Models::Permission::OrSymbol) }
        attr_accessor :permission

        # The object type that the ACL applies to
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        attr_accessor :restrict_object_type

        sig do
          params(
            permission: Braintrust::Models::Permission::OrSymbol,
            restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)
          )
            .returns(T.attached_class)
        end
        def self.new(
          # Each permission permits a certain type of operation on an object in the system
          #
          # Permissions can be assigned to to objects on an individual basis, or grouped
          # into roles
          permission:,
          # The object type that the ACL applies to
          restrict_object_type: nil
        ); end
        sig do
          override
            .returns(
              {
                permission: Braintrust::Models::Permission::OrSymbol,
                restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)
              }
            )
        end
        def to_hash; end
      end
    end
  end
end
