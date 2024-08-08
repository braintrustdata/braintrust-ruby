# frozen_string_literal: true

module Braintrust
  module Models
    class PatchRole < BaseModel
      # @!attribute [rw] add_member_permissions
      #   A list of permissions to add to the role
      #   @return [Array<Braintrust::Models::PatchRole::AddMemberPermission>]
      optional :add_member_permissions,
               Braintrust::ArrayOf.new(-> { Braintrust::Models::PatchRole::AddMemberPermission })

      # @!attribute [rw] add_member_roles
      #   A list of role IDs to add to the role's inheriting-from set
      #   @return [Array<String>]
      optional :add_member_roles, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] description
      #   Textual description of the role
      #   @return [String]
      optional :description, String

      # @!attribute [rw] name_
      #   Name of the role
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] remove_member_permissions
      #   A list of permissions to remove from the role
      #   @return [Array<Braintrust::Models::PatchRole::RemoveMemberPermission>]
      optional :remove_member_permissions,
               Braintrust::ArrayOf.new(-> { Braintrust::Models::PatchRole::RemoveMemberPermission })

      # @!attribute [rw] remove_member_roles
      #   A list of role IDs to remove from the role's inheriting-from set
      #   @return [Array<String>]
      optional :remove_member_roles, Braintrust::ArrayOf.new(String)

      class AddMemberPermission < BaseModel
        # @!attribute [rw] permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        # Permissions can be assigned to to objects on an individual basis, or grouped into roles
        #   @return [Symbol]
        required :permission,
                 Braintrust::Enum.new(
                   :create,
                   :read,
                   :update,
                   :delete,
                   :create_acls,
                   :read_acls,
                   :update_acls,
                   :delete_acls
                 )

        # @!attribute [rw] restrict_object_type
        #   The object type that the ACL applies to
        #   @return [Symbol]
        optional :restrict_object_type,
                 Braintrust::Enum.new(
                   :organization,
                   :project,
                   :experiment,
                   :dataset,
                   :prompt,
                   :prompt_session,
                   :group,
                   :role,
                   :org_member,
                   :project_log,
                   :org_project
                 )
      end

      class RemoveMemberPermission < BaseModel
        # @!attribute [rw] permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        # Permissions can be assigned to to objects on an individual basis, or grouped into roles
        #   @return [Symbol]
        required :permission,
                 Braintrust::Enum.new(
                   :create,
                   :read,
                   :update,
                   :delete,
                   :create_acls,
                   :read_acls,
                   :update_acls,
                   :delete_acls
                 )

        # @!attribute [rw] restrict_object_type
        #   The object type that the ACL applies to
        #   @return [Symbol]
        optional :restrict_object_type,
                 Braintrust::Enum.new(
                   :organization,
                   :project,
                   :experiment,
                   :dataset,
                   :prompt,
                   :prompt_session,
                   :group,
                   :role,
                   :org_member,
                   :project_log,
                   :org_project
                 )
      end
    end
  end
end
