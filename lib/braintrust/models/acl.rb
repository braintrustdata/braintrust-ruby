# frozen_string_literal: true

module Braintrust
  module Models
    class ACL < Braintrust::BaseModel
      # @!attribute id
      #   Unique identifier for the acl
      #
      #   @return [String]
      required :id, String

      # @!attribute _object_org_id
      #   The organization the ACL's referred object belongs to
      #
      #   @return [String]
      required :_object_org_id, String

      # @!attribute object_id_
      #   The id of the object the ACL applies to
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::Models::ACL::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACL::ObjectType }

      # @!attribute created
      #   Date of acl creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

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
      #   @return [Symbol, Braintrust::Models::ACL::Permission, nil]
      optional :permission, enum: -> { Braintrust::Models::ACL::Permission }, nil?: true

      # @!attribute restrict_object_type
      #   When setting a permission directly, optionally restricts the permission grant to
      #     just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @return [Symbol, Braintrust::Models::ACL::RestrictObjectType, nil]
      optional :restrict_object_type, enum: -> { Braintrust::Models::ACL::RestrictObjectType }, nil?: true

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
      #   # An ACL grants a certain permission or role to a certain user or group on an
      #   #   object.
      #   #
      #   #   ACLs are inherited across the object hierarchy. So for example, if a user has
      #   #   read permissions on a project, they will also have read permissions on any
      #   #   experiment, dataset, etc. created within that project.
      #   #
      #   #   To restrict a grant to a particular sub-object, you may specify
      #   #   `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #   #   part of a role.
      #   #
      #   # @param id [String]
      #   # @param _object_org_id [String]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::ACL::ObjectType]
      #   # @param created [Time, nil]
      #   # @param group_id [String, nil]
      #   # @param permission [Symbol, Braintrust::Models::ACL::Permission, nil]
      #   # @param restrict_object_type [Symbol, Braintrust::Models::ACL::RestrictObjectType, nil]
      #   # @param role_id [String, nil]
      #   # @param user_id [String, nil]
      #   #
      #   def initialize(
      #     id:,
      #     _object_org_id:,
      #     object_id_:,
      #     object_type:,
      #     created: nil,
      #     group_id: nil,
      #     permission: nil,
      #     restrict_object_type: nil,
      #     role_id: nil,
      #     user_id: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # The object type that the ACL applies to
      #
      # @example
      # ```ruby
      # case object_type
      # in :organization
      #   # ...
      # in :project
      #   # ...
      # in :experiment
      #   # ...
      # in :dataset
      #   # ...
      # in :prompt
      #   # ...
      # in ...
      #   #...
      # end
      # ```
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

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end

      # @abstract
      #
      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      #
      # @example
      # ```ruby
      # case permission
      # in :create
      #   # ...
      # in :read
      #   # ...
      # in :update
      #   # ...
      # in :delete
      #   # ...
      # in :create_acls
      #   # ...
      # in ...
      #   #...
      # end
      # ```
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

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end

      # @abstract
      #
      # When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      #
      # @example
      # ```ruby
      # case restrict_object_type
      # in :organization
      #   # ...
      # in :project
      #   # ...
      # in :experiment
      #   # ...
      # in :dataset
      #   # ...
      # in :prompt
      #   # ...
      # in ...
      #   #...
      # end
      # ```
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

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
