# frozen_string_literal: true

module Braintrust
  module Models
    class ACLFindAndDeleteParams < Braintrust::BaseModel
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
      #   @return [Symbol, Braintrust::Models::ACLFindAndDeleteParams::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACLFindAndDeleteParams::ObjectType }

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
      #   @return [Symbol, Braintrust::Models::ACLFindAndDeleteParams::Permission, nil]
      optional :permission, enum: -> { Braintrust::Models::ACLFindAndDeleteParams::Permission }, nil?: true

      # @!attribute restrict_object_type
      #   When setting a permission directly, optionally restricts the permission grant to
      #     just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @return [Symbol, Braintrust::Models::ACLFindAndDeleteParams::RestrictObjectType, nil]
      optional :restrict_object_type,
               enum: -> { Braintrust::Models::ACLFindAndDeleteParams::RestrictObjectType },
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
      #   # @param object_type [Symbol, Braintrust::Models::ACLFindAndDeleteParams::ObjectType]
      #   # @param group_id [String, nil]
      #   # @param permission [Symbol, Braintrust::Models::ACLFindAndDeleteParams::Permission, nil]
      #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLFindAndDeleteParams::RestrictObjectType, nil]
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
