# frozen_string_literal: true

module Braintrust
  module Models
    class PatchGroup < BaseModel
      # @!attribute [rw] add_member_groups
      #   A list of group IDs to add to the group's inheriting-from set
      #   @return [Array<String>]
      optional :add_member_groups, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] add_member_users
      #   A list of user IDs to add to the group
      #   @return [Array<String>]
      optional :add_member_users, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] description
      #   Textual description of the group
      #   @return [String]
      optional :description, String

      # @!attribute [rw] name_
      #   Name of the group
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] remove_member_groups
      #   A list of group IDs to remove from the group's inheriting-from set
      #   @return [Array<String>]
      optional :remove_member_groups, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] remove_member_users
      #   A list of user IDs to remove from the group
      #   @return [Array<String>]
      optional :remove_member_users, Braintrust::ArrayOf.new(String)
    end
  end
end
