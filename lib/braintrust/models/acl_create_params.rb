# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ACLs#create
    class ACLCreateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      #   @return [Symbol, Braintrust::Models::Permission, nil]
      optional :permission, enum: -> { Braintrust::Models::Permission }, nil?: true

      # @!attribute restrict_object_type
      #   When setting a permission directly, optionally restricts the permission grant to
      #     just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @return [Symbol, Braintrust::Models::ACLObjectType, nil]
      optional :restrict_object_type, enum: -> { Braintrust::Models::ACLObjectType }, nil?: true

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
      #   # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      #   # @param group_id [String, nil]
      #   # @param permission [Symbol, Braintrust::Models::Permission, nil]
      #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
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

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
