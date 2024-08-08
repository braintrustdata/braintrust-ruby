# frozen_string_literal: true

module Braintrust
  module Models
    class CreateGroup < BaseModel
      # @!attribute [rw] name_
      #   Name of the group
      #   @return [String]
      required :name_, String

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

      # @!attribute [rw] org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case that your API key belongs to multiple organizations, you may specify the name of the organization the group belongs in.
      #   @return [String]
      optional :org_name, String
    end
  end
end
