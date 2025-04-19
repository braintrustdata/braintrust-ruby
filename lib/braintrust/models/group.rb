# frozen_string_literal: true

module Braintrust
  module Models
    class Group < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the group
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the group
      #
      #   @return [String]
      required :name, String

      # @!attribute org_id
      #   Unique id for the organization that the group belongs under
      #
      #   It is forbidden to change the org after creating a group
      #
      #   @return [String]
      required :org_id, String

      # @!attribute created
      #   Date of group creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute deleted_at
      #   Date of group deletion, or null if the group is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

      # @!attribute description
      #   Textual description of the group
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute member_groups
      #   Ids of the groups this group inherits from
      #
      #   An inheriting group has all the users contained in its member groups, as well as
      #   all of their inherited users
      #
      #   @return [Array<String>, nil]
      optional :member_groups, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute member_users
      #   Ids of users which belong to this group
      #
      #   @return [Array<String>, nil]
      optional :member_users, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute user_id
      #   Identifies the user who created the group
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(id:, name:, org_id:, created: nil, deleted_at: nil, description: nil, member_groups: nil, member_users: nil, user_id: nil)
      #   A group is a collection of users which can be assigned an ACL
      #
      #   Groups can consist of individual users, as well as a set of groups they inherit
      #   from
      #
      #   @param id [String]
      #   @param name [String]
      #   @param org_id [String]
      #   @param created [Time, nil]
      #   @param deleted_at [Time, nil]
      #   @param description [String, nil]
      #   @param member_groups [Array<String>, nil]
      #   @param member_users [Array<String>, nil]
      #   @param user_id [String, nil]
    end
  end
end
