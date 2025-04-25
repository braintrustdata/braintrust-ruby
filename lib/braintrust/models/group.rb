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
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::Group} for more details.
      #
      #   A group is a collection of users which can be assigned an ACL
      #
      #   Groups can consist of individual users, as well as a set of groups they inherit
      #   from
      #
      #   @param id [String] Unique identifier for the group
      #
      #   @param name [String] Name of the group
      #
      #   @param org_id [String] Unique id for the organization that the group belongs under ...
      #
      #   @param created [Time, nil] Date of group creation
      #
      #   @param deleted_at [Time, nil] Date of group deletion, or null if the group is still active
      #
      #   @param description [String, nil] Textual description of the group
      #
      #   @param member_groups [Array<String>, nil] Ids of the groups this group inherits from ...
      #
      #   @param member_users [Array<String>, nil] Ids of users which belong to this group
      #
      #   @param user_id [String, nil] Identifies the user who created the group
    end
  end
end
