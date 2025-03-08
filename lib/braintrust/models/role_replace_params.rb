# frozen_string_literal: true

module Braintrust
  module Models
    class RoleReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute name
      #   Name of the role
      #
      #   @return [String]
      required :name, String

      # @!attribute description
      #   Textual description of the role
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute member_permissions
      #   (permission, restrict_object_type) tuples which belong to this role
      #
      #   @return [Array<Braintrust::Models::RoleReplaceParams::MemberPermission>, nil]
      optional :member_permissions,
               -> { Braintrust::ArrayOf[Braintrust::Models::RoleReplaceParams::MemberPermission] },
               nil?: true

      # @!attribute member_roles
      #   Ids of the roles this role inherits from
      #
      #     An inheriting role has all the permissions contained in its member roles, as
      #     well as all of their inherited permissions
      #
      #   @return [Array<String>, nil]
      optional :member_roles, Braintrust::ArrayOf[String], nil?: true

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the role belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param description [String, nil]
      #   # @param member_permissions [Array<Braintrust::Models::RoleReplaceParams::MemberPermission>, nil]
      #   # @param member_roles [Array<String>, nil]
      #   # @param org_name [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     name:,
      #     description: nil,
      #     member_permissions: nil,
      #     member_roles: nil,
      #     org_name: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      class MemberPermission < Braintrust::BaseModel
        # @!attribute permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        #     Permissions can be assigned to to objects on an individual basis, or grouped
        #     into roles
        #
        #   @return [Symbol, Braintrust::Models::RoleReplaceParams::MemberPermission::Permission]
        required :permission, enum: -> { Braintrust::Models::RoleReplaceParams::MemberPermission::Permission }

        # @!attribute restrict_object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::RoleReplaceParams::MemberPermission::RestrictObjectType, nil]
        optional :restrict_object_type,
                 enum: -> { Braintrust::Models::RoleReplaceParams::MemberPermission::RestrictObjectType },
                 nil?: true

        # @!parse
        #   # @param permission [Symbol, Braintrust::Models::RoleReplaceParams::MemberPermission::Permission]
        #   # @param restrict_object_type [Symbol, Braintrust::Models::RoleReplaceParams::MemberPermission::RestrictObjectType, nil]
        #   #
        #   def initialize(permission:, restrict_object_type: nil, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void

        # @abstract
        #
        # Each permission permits a certain type of operation on an object in the system
        #
        #   Permissions can be assigned to to objects on an individual basis, or grouped
        #   into roles
        class Permission < Braintrust::Enum
          CREATE = :create
          READ = :read
          UPDATE = :update
          DELETE = :delete
          CREATE_ACLS = :create_acls
          READ_ACLS = :read_acls
          UPDATE_ACLS = :update_acls
          DELETE_ACLS = :delete_acls

          finalize!
        end

        # @abstract
        #
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

          finalize!
        end
      end
    end
  end
end
