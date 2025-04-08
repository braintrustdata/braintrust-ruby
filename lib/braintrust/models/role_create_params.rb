# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Roles#create
    class RoleCreateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      #   @return [Array<Braintrust::Models::RoleCreateParams::MemberPermission>, nil]
      optional :member_permissions,
               -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::RoleCreateParams::MemberPermission] },
               nil?: true

      # @!attribute member_roles
      #   Ids of the roles this role inherits from
      #
      #   An inheriting role has all the permissions contained in its member roles, as
      #   well as all of their inherited permissions
      #
      #   @return [Array<String>, nil]
      optional :member_roles, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the role belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param description [String, nil]
      #   # @param member_permissions [Array<Braintrust::Models::RoleCreateParams::MemberPermission>, nil]
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

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      class MemberPermission < Braintrust::Internal::Type::BaseModel
        # @!attribute permission
        #   Each permission permits a certain type of operation on an object in the system
        #
        #   Permissions can be assigned to to objects on an individual basis, or grouped
        #   into roles
        #
        #   @return [Symbol, Braintrust::Models::Permission]
        required :permission, enum: -> { Braintrust::Models::Permission }

        # @!attribute restrict_object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::ACLObjectType, nil]
        optional :restrict_object_type, enum: -> { Braintrust::Models::ACLObjectType }, nil?: true

        # @!parse
        #   # @param permission [Symbol, Braintrust::Models::Permission]
        #   # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
        #   #
        #   def initialize(permission:, restrict_object_type: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end
    end
  end
end
