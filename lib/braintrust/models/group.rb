# frozen_string_literal: true

module Braintrust
  module Models
    class Group < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the group
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the group
      #   @return [String]
      required :name_, String

      # @!attribute [rw] org_id
      #   Unique id for the organization that the group belongs under
      #
      # It is forbidden to change the org after creating a group
      #   @return [String]
      required :org_id, String

      # @!attribute [rw] created
      #   Date of group creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] deleted_at
      #   Date of group deletion, or null if the group is still active
      #   @return [String]
      optional :deleted_at, String

      # @!attribute [rw] description
      #   Textual description of the group
      #   @return [String]
      optional :description, String

      # @!attribute [rw] member_groups
      #   Ids of the groups this group inherits from
      #
      # An inheriting group has all the users contained in its member groups, as well as all of their inherited users
      #   @return [Array<String>]
      optional :member_groups, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] member_users
      #   Ids of users which belong to this group
      #   @return [Array<String>]
      optional :member_users, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] user_id
      #   Identifies the user who created the group
      #   @return [String]
      optional :user_id, String
    end
  end
end
