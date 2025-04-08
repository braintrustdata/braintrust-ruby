# frozen_string_literal: true

module Braintrust
  module Models
    class ACL < Braintrust::Internal::Type::BaseModel
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
      #   @return [Symbol, Braintrust::Models::ACLObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACLObjectType }

      # @!attribute created
      #   Date of acl creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute group_id
      #   Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      #
      #   @return [String, nil]
      optional :group_id, String, nil?: true

      # @!attribute permission
      #   Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      #
      #   @return [Symbol, Braintrust::Models::Permission, nil]
      optional :permission, enum: -> { Braintrust::Models::Permission }, nil?: true

      # @!attribute restrict_object_type
      #   When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @return [Symbol, Braintrust::Models::ACLObjectType, nil]
      optional :restrict_object_type, enum: -> { Braintrust::Models::ACLObjectType }, nil?: true

      # @!attribute role_id
      #   Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      #
      #   @return [String, nil]
      optional :role_id, String, nil?: true

      # @!attribute user_id
      #   Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!parse
      #   # An ACL grants a certain permission or role to a certain user or group on an
      #   # object.
      #   #
      #   # ACLs are inherited across the object hierarchy. So for example, if a user has
      #   # read permissions on a project, they will also have read permissions on any
      #   # experiment, dataset, etc. created within that project.
      #   #
      #   # To restrict a grant to a particular sub-object, you may specify
      #   # `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #   # part of a role.
      #   #
      #   # @param id [String]
      #   # @param _object_org_id [String]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      #   # @param created [Time, nil]
      #   # @param group_id [String, nil]
      #   # @param permission [Symbol, Braintrust::Models::Permission, nil]
      #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
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

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
