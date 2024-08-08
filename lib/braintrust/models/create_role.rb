# frozen_string_literal: true

module Braintrust
  module Models
    class CreateRole < BaseModel
      # @!attribute [rw] name_
      #   Name of the role
      #   @return [String]
      required :name_, String

      # @!attribute [rw] description
      #   Textual description of the role
      #   @return [String]
      optional :description, String

      # @!attribute [rw] member_permissions
      #   (permission, restrict_object_type) tuples which belong to this role
      #   @return [Array<Braintrust::Models::CreateRole::MemberPermission>]
      optional :member_permissions,
               Braintrust::ArrayOf.new(-> { Braintrust::Models::CreateRole::MemberPermission })

      # @!attribute [rw] member_roles
      #   Ids of the roles this role inherits from
      #
      # An inheriting role has all the permissions contained in its member roles, as well as all of their inherited permissions
      #   @return [Array<String>]
      optional :member_roles, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case that your API key belongs to multiple organizations, you may specify the name of the organization the role belongs in.
      #   @return [String]
      optional :org_name, String

      class MemberPermission < BaseModel
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
