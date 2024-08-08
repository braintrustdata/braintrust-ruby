# frozen_string_literal: true

module Braintrust
  module Models
    class PatchOrganizationMembers < BaseModel
      # @!attribute [rw] invite_users
      #   Users to invite to the organization
      #   @return [Braintrust::Models::PatchOrganizationMembers::InviteUsers]
      optional :invite_users, -> { Braintrust::Models::PatchOrganizationMembers::InviteUsers }

      # @!attribute [rw] org_id
      #   For nearly all users, this parameter should be unnecessary. But in the rare case that your API key belongs to multiple organizations, or in case you want to explicitly assert the organization you are modifying, you may specify the id of the organization.
      #   @return [String]
      optional :org_id, String

      # @!attribute [rw] org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case that your API key belongs to multiple organizations, or in case you want to explicitly assert the organization you are modifying, you may specify the name of the organization.
      #   @return [String]
      optional :org_name, String

      # @!attribute [rw] remove_users
      #   Users to remove from the organization
      #   @return [Braintrust::Models::PatchOrganizationMembers::RemoveUsers]
      optional :remove_users, -> { Braintrust::Models::PatchOrganizationMembers::RemoveUsers }

      class InviteUsers < BaseModel
        # @!attribute [rw] emails
        #   Emails of users to invite
        #   @return [Array<String>]
        optional :emails, Braintrust::ArrayOf.new(String)

        # @!attribute [rw] group_id
        #   Optional id of a group to add newly-invited users to. Cannot specify both a group id and a group name.
        #   @return [String]
        optional :group_id, String

        # @!attribute [rw] group_name
        #   Optional name of a group to add newly-invited users to. Cannot specify both a group id and a group name.
        #   @return [String]
        optional :group_name, String

        # @!attribute [rw] ids
        #   Ids of existing users to invite
        #   @return [Array<String>]
        optional :ids, Braintrust::ArrayOf.new(String)

        # @!attribute [rw] send_invite_emails
        #   If true, send invite emails to the users who wore actually added
        #   @return [Boolean]
        optional :send_invite_emails, Braintrust::BooleanModel
      end

      class RemoveUsers < BaseModel
        # @!attribute [rw] emails
        #   Emails of users to remove
        #   @return [Array<String>]
        optional :emails, Braintrust::ArrayOf.new(String)

        # @!attribute [rw] ids
        #   Ids of users to remove
        #   @return [Array<String>]
        optional :ids, Braintrust::ArrayOf.new(String)
      end
    end
  end
end
