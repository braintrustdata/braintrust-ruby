# frozen_string_literal: true

module Braintrust
  module Models
    class ACL < Braintrust::BaseModel
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
      required :object_id_, String, api_name: :object_id

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   @return [Symbol, Braintrust::Models::ACL::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACL::ObjectType }

      # @!attribute [rw] created
      #   Date of acl creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] group_id
      #   Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will be provided
      #   @return [String]
      optional :group_id, String

      # @!attribute [rw] permission
      #   Permission the ACL grants. Exactly one of `permission` and `role_id` will be provided
      #   @return [Symbol, Braintrust::Models::ACL::Permission]
      optional :permission, enum: -> { Braintrust::Models::ACL::Permission }

      # @!attribute [rw] restrict_object_type
      #   When setting a permission directly, optionally restricts the permission grant to just the specified object type. Cannot be set alongside a `role_id`.
      #   @return [Symbol, Braintrust::Models::ACL::RestrictObjectType]
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

      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be provided
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

      # When setting a permission directly, optionally restricts the permission grant to just the specified object type. Cannot be set alongside a `role_id`.
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

      # @!parse
      #   # Create a new instance of ACL from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the acl
      #   #   @option data [String] :_object_org_id The organization the ACL's referred object belongs to
      #   #   @option data [String] :object_id The id of the object the ACL applies to
      #   #   @option data [String] :object_type The object type that the ACL applies to
      #   #   @option data [String, nil] :created Date of acl creation
      #   #   @option data [String, nil] :group_id Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   #     be provided
      #   #   @option data [String, nil] :permission Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   #     provided
      #   #   @option data [String, nil] :restrict_object_type When setting a permission directly, optionally restricts the permission grant to
      #   #     just the specified object type. Cannot be set alongside a `role_id`.
      #   #   @option data [String, nil] :role_id Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #   #     provided
      #   #   @option data [String, nil] :user_id Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   #     be provided
      #   def initialize(data = {}) = super
    end
  end
end
