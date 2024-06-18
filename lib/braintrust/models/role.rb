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
      required :name_, String

      # @!attribute [rw] created
      #   Date of role creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] deleted_at
      #   Date of role deletion, or null if the role is still active
      #   @return [String]
      optional :deleted_at, String

      # @!attribute [rw] description
      #   Textual description of the role
      #   @return [String]
      optional :description, String

      # @!attribute [rw] member_permissions
      #   Permissions which belong to this role
      #   @return [Array<Symbol>]
      optional :member_permissions,
               Braintrust::ArrayOf.new(Braintrust::Enum.new(
                 :create,
                 :read,
                 :update,
                 :delete,
                 :create_acls,
                 :read_acls,
                 :update_acls,
                 :delete_acls
               ))

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
    end
  end
end
