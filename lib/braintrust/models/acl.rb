# frozen_string_literal: true

module Braintrust
  module Models
    class ACL < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the acl
      #   @return [String]
      required :id, String

      # @!attribute [rw] _object_org_id
      #   The organization the ACL's referred object belongs to
      #   @return [String]
      required :_object_org_id, String

      # @!attribute [rw] object_id_
      #   The id of the object the ACL applies to
      #   @return [String]
      required :object_id_, String

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   One of the constants defined in {Braintrust::Models::ACL::ObjectType}
      #   @return [Symbol]
      required :object_type, enum: -> { Braintrust::Models::ACL::ObjectType }

      # @!attribute [rw] created
      #   Date of acl creation
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] group_id
      #   Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will be provided
      #   @return [String]
      optional :group_id, String

      # @!attribute [rw] permission
      #   Each permission permits a certain type of operation on an object in the system
      #
      # Permissions can be assigned to to objects on an individual basis, or grouped into roles
      #   One of the constants defined in {Braintrust::Models::ACL::Permission}
      #   @return [Symbol]
      optional :permission, enum: -> { Braintrust::Models::ACL::Permission }

      # @!attribute [rw] restrict_object_type
      #   The object type that the ACL applies to
      #   One of the constants defined in {Braintrust::Models::ACL::RestrictObjectType}
      #   @return [Symbol]
      optional :restrict_object_type, enum: -> { Braintrust::Models::ACL::RestrictObjectType }

      # @!attribute [rw] role_id
      #   Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be provided
      #   @return [String]
      optional :role_id, String

      # @!attribute [rw] user_id
      #   Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will be provided
      #   @return [String]
      optional :user_id, String

      # The object type that the ACL applies to
      class ObjectType < Braintrust::Enum
        ORGANIZATION = :organization
        PROJECT = :project
        EXPERIMENT = :experiment
        DATASET = :dataset
        PROMPT = :prompt
        PROMPT_SESSION = :prompt_session
        GROUP = :group
        ROLE = :role
        ORG_MEMBER = :org_member
        PROJECT_LOG = :project_log
        ORG_PROJECT = :org_project
      end

      # Each permission permits a certain type of operation on an object in the system
      #
      # Permissions can be assigned to to objects on an individual basis, or grouped into roles
      class Permission < Braintrust::Enum
        CREATE = :create
        READ = :read
        UPDATE = :update
        DELETE = :delete
        CREATE_ACLS = :create_acls
        READ_ACLS = :read_acls
        UPDATE_ACLS = :update_acls
        DELETE_ACLS = :delete_acls
      end

      # The object type that the ACL applies to
      class RestrictObjectType < Braintrust::Enum
        ORGANIZATION = :organization
        PROJECT = :project
        EXPERIMENT = :experiment
        DATASET = :dataset
        PROMPT = :prompt
        PROMPT_SESSION = :prompt_session
        GROUP = :group
        ROLE = :role
        ORG_MEMBER = :org_member
        PROJECT_LOG = :project_log
        ORG_PROJECT = :org_project
      end
    end
  end
end
