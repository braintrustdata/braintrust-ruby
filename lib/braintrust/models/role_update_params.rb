# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Roles#update
    class RoleUpdateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute add_member_permissions
      #   A list of permissions to add to the role
      #
      #   @return [Array<Braintrust::Models::RoleUpdateParams::AddMemberPermission>, nil]
      optional :add_member_permissions,
               -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::RoleUpdateParams::AddMemberPermission] },
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
      #   @return [Array<Braintrust::Models::RoleUpdateParams::RemoveMemberPermission>, nil]
      optional :remove_member_permissions,
               -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission] },
               nil?: true

      # @!attribute remove_member_roles
      #   A list of role IDs to remove from the role's inheriting-from set
      #
      #   @return [Array<String>, nil]
      optional :remove_member_roles, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!parse
      #   # @param add_member_permissions [Array<Braintrust::Models::RoleUpdateParams::AddMemberPermission>, nil]
      #   # @param add_member_roles [Array<String>, nil]
      #   # @param description [String, nil]
      #   # @param name [String, nil]
      #   # @param remove_member_permissions [Array<Braintrust::Models::RoleUpdateParams::RemoveMemberPermission>, nil]
      #   # @param remove_member_roles [Array<String>, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     add_member_permissions: nil,
      #     add_member_roles: nil,
      #     description: nil,
      #     name: nil,
      #     remove_member_permissions: nil,
      #     remove_member_roles: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      class AddMemberPermission < Braintrust::Internal::Type::BaseModel
        # @!attribute permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        #     Permissions can be assigned to to objects on an individual basis, or grouped
        #     into roles
        #
        #   @return [Symbol, Braintrust::Models::Permission]
        required :permission, enum: -> { Braintrust::Models::Permission }

        # @!attribute restrict_object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::ACLObjectType, nil]
        optional :restrict_object_type, enum: -> { Braintrust::Models::ACLObjectType }, nil?: true

        # @!parse
        #   # @param permission [Symbol, Braintrust::Models::Permission]
        #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
        #   #
        #   def initialize(permission:, restrict_object_type: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end

      class RemoveMemberPermission < Braintrust::Internal::Type::BaseModel
        # @!attribute permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        #     Permissions can be assigned to to objects on an individual basis, or grouped
        #     into roles
        #
        #   @return [Symbol, Braintrust::Models::Permission]
        required :permission, enum: -> { Braintrust::Models::Permission }

        # @!attribute restrict_object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::ACLObjectType, nil]
        optional :restrict_object_type, enum: -> { Braintrust::Models::ACLObjectType }, nil?: true

        # @!parse
        #   # @param permission [Symbol, Braintrust::Models::Permission]
        #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
        #   #
        #   def initialize(permission:, restrict_object_type: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end
    end
  end
end
