# frozen_string_literal: true

module Braintrust
  module Models
    class ACLCreateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute object_id_
      #   The id of the object the ACL applies to
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::Models::ACLCreateParams::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACLCreateParams::ObjectType }

      # @!attribute group_id
      #   Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      #   @return [String, nil]
      optional :group_id, String, nil?: true

      # @!attribute permission
      #   Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #
      #   @return [Symbol, Braintrust::Models::ACLCreateParams::Permission, nil]
      optional :permission, enum: -> { Braintrust::Models::ACLCreateParams::Permission }, nil?: true

      # @!attribute restrict_object_type
      #   When setting a permission directly, optionally restricts the permission grant to
      #     just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @return [Symbol, Braintrust::Models::ACLCreateParams::RestrictObjectType, nil]
      optional :restrict_object_type,
               enum: -> { Braintrust::Models::ACLCreateParams::RestrictObjectType },
               nil?: true

      # @!attribute role_id
      #   Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #
      #   @return [String, nil]
      optional :role_id, String, nil?: true

      # @!attribute user_id
      #   Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!parse
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::ACLCreateParams::ObjectType]
      #   # @param group_id [String, nil]
      #   # @param permission [Symbol, Braintrust::Models::ACLCreateParams::Permission, nil]
      #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLCreateParams::RestrictObjectType, nil]
      #   # @param role_id [String, nil]
      #   # @param user_id [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     object_id_:,
      #     object_type:,
      #     group_id: nil,
      #     permission: nil,
      #     restrict_object_type: nil,
      #     role_id: nil,
      #     user_id: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
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

        finalize!
      end

      # @abstract
      #
      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
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
      # When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
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
