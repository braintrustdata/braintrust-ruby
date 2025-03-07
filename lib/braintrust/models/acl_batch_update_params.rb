# frozen_string_literal: true

module Braintrust
  module Models
    class ACLBatchUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute add_acls
      #   An ACL grants a certain permission or role to a certain user or group on an
      #     object.
      #
      #     ACLs are inherited across the object hierarchy. So for example, if a user has
      #     read permissions on a project, they will also have read permissions on any
      #     experiment, dataset, etc. created within that project.
      #
      #     To restrict a grant to a particular sub-object, you may specify
      #     `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #     part of a role.
      #
      #   @return [Array<Braintrust::Models::ACLBatchUpdateParams::AddACL>, nil]
      optional :add_acls,
               -> { Braintrust::ArrayOf[Braintrust::Models::ACLBatchUpdateParams::AddACL] },
               nil?: true

      # @!attribute remove_acls
      #   An ACL grants a certain permission or role to a certain user or group on an
      #     object.
      #
      #     ACLs are inherited across the object hierarchy. So for example, if a user has
      #     read permissions on a project, they will also have read permissions on any
      #     experiment, dataset, etc. created within that project.
      #
      #     To restrict a grant to a particular sub-object, you may specify
      #     `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #     part of a role.
      #
      #   @return [Array<Braintrust::Models::ACLBatchUpdateParams::RemoveACL>, nil]
      optional :remove_acls,
               -> { Braintrust::ArrayOf[Braintrust::Models::ACLBatchUpdateParams::RemoveACL] },
               nil?: true

      # @!parse
      #   # @param add_acls [Array<Braintrust::Models::ACLBatchUpdateParams::AddACL>, nil]
      #   # @param remove_acls [Array<Braintrust::Models::ACLBatchUpdateParams::RemoveACL>, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(add_acls: nil, remove_acls: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      class AddACL < Braintrust::BaseModel
        # @!attribute object_id_
        #   The id of the object the ACL applies to
        #
        #   @return [String]
        required :object_id_, String, api_name: :object_id

        # @!attribute object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::ACLBatchUpdateParams::AddACL::ObjectType]
        required :object_type, enum: -> { Braintrust::Models::ACLBatchUpdateParams::AddACL::ObjectType }

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
        #   @return [Symbol, Braintrust::Models::ACLBatchUpdateParams::AddACL::Permission, nil]
        optional :permission,
                 enum: -> { Braintrust::Models::ACLBatchUpdateParams::AddACL::Permission },
                 nil?: true

        # @!attribute restrict_object_type
        #   When setting a permission directly, optionally restricts the permission grant to
        #     just the specified object type. Cannot be set alongside a `role_id`.
        #
        #   @return [Symbol, Braintrust::Models::ACLBatchUpdateParams::AddACL::RestrictObjectType, nil]
        optional :restrict_object_type,
                 enum: -> { Braintrust::Models::ACLBatchUpdateParams::AddACL::RestrictObjectType },
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
        #   # @param object_id_ [String]
        #   # @param object_type [Symbol, Braintrust::Models::ACLBatchUpdateParams::AddACL::ObjectType]
        #   # @param group_id [String, nil]
        #   # @param permission [Symbol, Braintrust::Models::ACLBatchUpdateParams::AddACL::Permission, nil]
        #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLBatchUpdateParams::AddACL::RestrictObjectType, nil]
        #   # @param role_id [String, nil]
        #   # @param user_id [String, nil]
        #   #
        #   def initialize(
        #     object_id_:,
        #     object_type:,
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

      class RemoveACL < Braintrust::BaseModel
        # @!attribute object_id_
        #   The id of the object the ACL applies to
        #
        #   @return [String]
        required :object_id_, String, api_name: :object_id

        # @!attribute object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::ACLBatchUpdateParams::RemoveACL::ObjectType]
        required :object_type, enum: -> { Braintrust::Models::ACLBatchUpdateParams::RemoveACL::ObjectType }

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
        #   @return [Symbol, Braintrust::Models::ACLBatchUpdateParams::RemoveACL::Permission, nil]
        optional :permission,
                 enum: -> { Braintrust::Models::ACLBatchUpdateParams::RemoveACL::Permission },
                 nil?: true

        # @!attribute restrict_object_type
        #   When setting a permission directly, optionally restricts the permission grant to
        #     just the specified object type. Cannot be set alongside a `role_id`.
        #
        #   @return [Symbol, Braintrust::Models::ACLBatchUpdateParams::RemoveACL::RestrictObjectType, nil]
        optional :restrict_object_type,
                 enum: -> { Braintrust::Models::ACLBatchUpdateParams::RemoveACL::RestrictObjectType },
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
        #   # @param object_id_ [String]
        #   # @param object_type [Symbol, Braintrust::Models::ACLBatchUpdateParams::RemoveACL::ObjectType]
        #   # @param group_id [String, nil]
        #   # @param permission [Symbol, Braintrust::Models::ACLBatchUpdateParams::RemoveACL::Permission, nil]
        #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLBatchUpdateParams::RemoveACL::RestrictObjectType, nil]
        #   # @param role_id [String, nil]
        #   # @param user_id [String, nil]
        #   #
        #   def initialize(
        #     object_id_:,
        #     object_type:,
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
end
