# frozen_string_literal: true

module Braintrust
  module Models
    class Role < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the role
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the role
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] created
      #   Date of role creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] deleted_at
      #   Date of role deletion, or null if the role is still active
      #   @return [Time]
      optional :deleted_at, Time

      # @!attribute [rw] description
      #   Textual description of the role
      #   @return [String]
      optional :description, String

      # @!attribute [rw] member_permissions
      #   (permission, restrict_object_type) tuples which belong to this role
      #   @return [Array<Braintrust::Models::Role::MemberPermission>]
      optional :member_permissions, Braintrust::ArrayOf.new(-> { Braintrust::Models::Role::MemberPermission })

      # @!attribute [rw] member_roles
      #   Ids of the roles this role inherits from
      #
      # An inheriting role has all the permissions contained in its member roles, as well as all of their inherited permissions
      #   @return [Array<String>]
      optional :member_roles, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] org_id
      #   Unique id for the organization that the role belongs under
      #
      # A null org_id indicates a system role, which may be assigned to anybody and inherited by any other role, but cannot be edited.
      #
      # It is forbidden to change the org after creating a role
      #   @return [String]
      optional :org_id, String

      # @!attribute [rw] user_id
      #   Identifies the user who created the role
      #   @return [String]
      optional :user_id, String

      class MemberPermission < BaseModel
        # @!attribute [rw] permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        # Permissions can be assigned to to objects on an individual basis, or grouped into roles
        #   @return [Symbol, Braintrust::Models::Role::MemberPermission::Permission]
        required :permission, enum: -> { Braintrust::Models::Role::MemberPermission::Permission }

        # @!attribute [rw] restrict_object_type
        #   The object type that the ACL applies to
        #   @return [Symbol, Braintrust::Models::Role::MemberPermission::RestrictObjectType]
        optional :restrict_object_type,
                 enum: -> { Braintrust::Models::Role::MemberPermission::RestrictObjectType }

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

        # @!parse
        #   # Create a new instance of MemberPermission from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :permission Each permission permits a certain type of operation on an object in the system
        #   #
        #   #     Permissions can be assigned to to objects on an individual basis, or grouped
        #   #     into roles
        #   #   @option data [String, nil] :restrict_object_type The object type that the ACL applies to
        #   def initialize(data = {}) = super
      end

      # @!parse
      #   # Create a new instance of Role from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the role
      #   #   @option data [String] :name Name of the role
      #   #   @option data [String, nil] :created Date of role creation
      #   #   @option data [String, nil] :deleted_at Date of role deletion, or null if the role is still active
      #   #   @option data [String, nil] :description Textual description of the role
      #   #   @option data [Array<Object>, nil] :member_permissions (permission, restrict_object_type) tuples which belong to this role
      #   #   @option data [Array<String>, nil] :member_roles Ids of the roles this role inherits from
      #   #
      #   #     An inheriting role has all the permissions contained in its member roles, as
      #   #     well as all of their inherited permissions
      #   #   @option data [String, nil] :org_id Unique id for the organization that the role belongs under
      #   #
      #   #     A null org_id indicates a system role, which may be assigned to anybody and
      #   #     inherited by any other role, but cannot be edited.
      #   #
      #   #     It is forbidden to change the org after creating a role
      #   #   @option data [String, nil] :user_id Identifies the user who created the role
      #   def initialize(data = {}) = super
    end
  end
end
