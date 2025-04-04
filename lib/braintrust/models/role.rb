# frozen_string_literal: true

module Braintrust
  module Models
    class Role < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the role
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the role
      #
      #   @return [String]
      required :name, String

      # @!attribute created
      #   Date of role creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute deleted_at
      #   Date of role deletion, or null if the role is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

      # @!attribute description
      #   Textual description of the role
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute member_permissions
      #   (permission, restrict_object_type) tuples which belong to this role
      #
      #   @return [Array<Braintrust::Models::Role::MemberPermission>, nil]
      optional :member_permissions,
               -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::Role::MemberPermission] },
               nil?: true

      # @!attribute member_roles
      #   Ids of the roles this role inherits from
      #
      #     An inheriting role has all the permissions contained in its member roles, as
      #     well as all of their inherited permissions
      #
      #   @return [Array<String>, nil]
      optional :member_roles, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute org_id
      #   Unique id for the organization that the role belongs under
      #
      #     A null org_id indicates a system role, which may be assigned to anybody and
      #     inherited by any other role, but cannot be edited.
      #
      #     It is forbidden to change the org after creating a role
      #
      #   @return [String, nil]
      optional :org_id, String, nil?: true

      # @!attribute user_id
      #   Identifies the user who created the role
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!parse
      #   # A role is a collection of permissions which can be granted as part of an ACL
      #   #
      #   #   Roles can consist of individual permissions, as well as a set of roles they
      #   #   inherit from
      #   #
      #   # @param id [String]
      #   # @param name [String]
      #   # @param created [Time, nil]
      #   # @param deleted_at [Time, nil]
      #   # @param description [String, nil]
      #   # @param member_permissions [Array<Braintrust::Models::Role::MemberPermission>, nil]
      #   # @param member_roles [Array<String>, nil]
      #   # @param org_id [String, nil]
      #   # @param user_id [String, nil]
      #   #
      #   def initialize(
      #     id:,
      #     name:,
      #     created: nil,
      #     deleted_at: nil,
      #     description: nil,
      #     member_permissions: nil,
      #     member_roles: nil,
      #     org_id: nil,
      #     user_id: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      class MemberPermission < Braintrust::Internal::Type::BaseModel
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
