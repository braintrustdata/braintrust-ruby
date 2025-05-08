# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Roles#update
    class RoleUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute add_member_permissions
      #   A list of permissions to add to the role
      #
      #   @return [Array<Braintrust::RoleUpdateParams::AddMemberPermission>, nil]
      optional :add_member_permissions,
               -> { Braintrust::Internal::Type::ArrayOf[Braintrust::RoleUpdateParams::AddMemberPermission] },
               nil?: true

      # @!attribute add_member_roles
      #   A list of role IDs to add to the role's inheriting-from set
      #
      #   @return [Array<String>, nil]
      optional :add_member_roles, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute description
      #   Textual description of the role
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #   Name of the role
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute remove_member_permissions
      #   A list of permissions to remove from the role
      #
      #   @return [Array<Braintrust::RoleUpdateParams::RemoveMemberPermission>, nil]
      optional :remove_member_permissions,
               -> {
                 Braintrust::Internal::Type::ArrayOf[Braintrust::RoleUpdateParams::RemoveMemberPermission]
               },
               nil?: true

      # @!attribute remove_member_roles
      #   A list of role IDs to remove from the role's inheriting-from set
      #
      #   @return [Array<String>, nil]
      optional :remove_member_roles, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(add_member_permissions: nil, add_member_roles: nil, description: nil, name: nil, remove_member_permissions: nil, remove_member_roles: nil, request_options: {})
      #   @param add_member_permissions [Array<Braintrust::RoleUpdateParams::AddMemberPermission>, nil] A list of permissions to add to the role
      #
      #   @param add_member_roles [Array<String>, nil] A list of role IDs to add to the role's inheriting-from set
      #
      #   @param description [String, nil] Textual description of the role
      #
      #   @param name [String, nil] Name of the role
      #
      #   @param remove_member_permissions [Array<Braintrust::RoleUpdateParams::RemoveMemberPermission>, nil] A list of permissions to remove from the role
      #
      #   @param remove_member_roles [Array<String>, nil] A list of role IDs to remove from the role's inheriting-from set
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      class AddMemberPermission < Braintrust::Internal::Type::BaseModel
        # @!attribute permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        #   Permissions can be assigned to to objects on an individual basis, or grouped
        #   into roles
        #
        #   @return [Symbol, Braintrust::Permission]
        required :permission, enum: -> { Braintrust::Permission }

        # @!attribute restrict_object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::ACLObjectType, nil]
        optional :restrict_object_type, enum: -> { Braintrust::ACLObjectType }, nil?: true

        # @!method initialize(permission:, restrict_object_type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Braintrust::RoleUpdateParams::AddMemberPermission} for more details.
        #
        #   @param permission [Symbol, Braintrust::Permission] Each permission permits a certain type of operation on an object in the system
        #
        #   @param restrict_object_type [Symbol, Braintrust::ACLObjectType, nil] The object type that the ACL applies to
      end

      class RemoveMemberPermission < Braintrust::Internal::Type::BaseModel
        # @!attribute permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        #   Permissions can be assigned to to objects on an individual basis, or grouped
        #   into roles
        #
        #   @return [Symbol, Braintrust::Permission]
        required :permission, enum: -> { Braintrust::Permission }

        # @!attribute restrict_object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::ACLObjectType, nil]
        optional :restrict_object_type, enum: -> { Braintrust::ACLObjectType }, nil?: true

        # @!method initialize(permission:, restrict_object_type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Braintrust::RoleUpdateParams::RemoveMemberPermission} for more details.
        #
        #   @param permission [Symbol, Braintrust::Permission] Each permission permits a certain type of operation on an object in the system
        #
        #   @param restrict_object_type [Symbol, Braintrust::ACLObjectType, nil] The object type that the ACL applies to
      end
    end
  end
end
