# frozen_string_literal: true

module Braintrust
  module Models
    class CreateACL < BaseModel
      # @!attribute [rw] object_id_
      #   The id of the object the ACL applies to
      #   @return [String]
      required :object_id_, String

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   @return [Symbol]
      required :object_type,
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

      # @!attribute [rw] group_id
      #   Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will be provided
      #   @return [String]
      optional :group_id, String

      # @!attribute [rw] permission
      #   Permission the ACL grants. Exactly one of `permission` and `role_id` will be provided
      #   @return [Symbol]
      optional :permission,
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
      #   When setting a permission directly, optionally restricts the permission grant to just the specified object type. Cannot be set alongside a `role_id`.
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

      # @!attribute [rw] role_id
      #   Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be provided
      #   @return [String]
      optional :role_id, String

      # @!attribute [rw] user_id
      #   Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will be provided
      #   @return [String]
      optional :user_id, String
    end
  end
end
