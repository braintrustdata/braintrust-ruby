# frozen_string_literal: true

module Braintrust
  module Models
    module Organizations
      # @see Braintrust::Resources::Organizations::Members#update
      class MemberUpdateParams < Braintrust::Internal::Type::BaseModel
        # @!parse
        #   extend Braintrust::Internal::Type::RequestParameters::Converter
        include Braintrust::Internal::Type::RequestParameters

        # @!attribute invite_users
        #   Users to invite to the organization
        #
        #   @return [Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, nil]
        optional :invite_users,
                 -> { Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers },
                 nil?: true

        # @!attribute org_id
        #   For nearly all users, this parameter should be unnecessary. But in the rare case
        #     that your API key belongs to multiple organizations, or in case you want to
        #     explicitly assert the organization you are modifying, you may specify the id of
        #     the organization.
        #
        #   @return [String, nil]
        optional :org_id, String, nil?: true

        # @!attribute org_name
        #   For nearly all users, this parameter should be unnecessary. But in the rare case
        #     that your API key belongs to multiple organizations, or in case you want to
        #     explicitly assert the organization you are modifying, you may specify the name
        #     of the organization.
        #
        #   @return [String, nil]
        optional :org_name, String, nil?: true

        # @!attribute remove_users
        #   Users to remove from the organization
        #
        #   @return [Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, nil]
        optional :remove_users,
                 -> { Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers },
                 nil?: true

        # @!parse
        #   # @param invite_users [Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, nil]
        #   # @param org_id [String, nil]
        #   # @param org_name [String, nil]
        #   # @param remove_users [Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, nil]
        #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(invite_users: nil, org_id: nil, org_name: nil, remove_users: nil, request_options: {}, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

        class InviteUsers < Braintrust::Internal::Type::BaseModel
          # @!attribute emails
          #   Emails of users to invite
          #
          #   @return [Array<String>, nil]
          optional :emails, Braintrust::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute group_id
          #   Singular form of group_ids
          #
          #   @return [String, nil]
          optional :group_id, String, nil?: true

          # @!attribute group_ids
          #   Optional list of group ids to add newly-invited users to.
          #
          #   @return [Array<String>, nil]
          optional :group_ids, Braintrust::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute group_name
          #   Singular form of group_names
          #
          #   @return [String, nil]
          optional :group_name, String, nil?: true

          # @!attribute group_names
          #   Optional list of group names to add newly-invited users to.
          #
          #   @return [Array<String>, nil]
          optional :group_names, Braintrust::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute ids
          #   Ids of existing users to invite
          #
          #   @return [Array<String>, nil]
          optional :ids, Braintrust::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute send_invite_emails
          #   If true, send invite emails to the users who wore actually added
          #
          #   @return [Boolean, nil]
          optional :send_invite_emails, Braintrust::Internal::Type::Boolean, nil?: true

          # @!parse
          #   # Users to invite to the organization
          #   #
          #   # @param emails [Array<String>, nil]
          #   # @param group_id [String, nil]
          #   # @param group_ids [Array<String>, nil]
          #   # @param group_name [String, nil]
          #   # @param group_names [Array<String>, nil]
          #   # @param ids [Array<String>, nil]
          #   # @param send_invite_emails [Boolean, nil]
          #   #
          #   def initialize(
          #     emails: nil,
          #     group_id: nil,
          #     group_ids: nil,
          #     group_name: nil,
          #     group_names: nil,
          #     ids: nil,
          #     send_invite_emails: nil,
          #     **
          #   )
          #     super
          #   end

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class RemoveUsers < Braintrust::Internal::Type::BaseModel
          # @!attribute emails
          #   Emails of users to remove
          #
          #   @return [Array<String>, nil]
          optional :emails, Braintrust::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute ids
          #   Ids of users to remove
          #
          #   @return [Array<String>, nil]
          optional :ids, Braintrust::Internal::Type::ArrayOf[String], nil?: true

          # @!parse
          #   # Users to remove from the organization
          #   #
          #   # @param emails [Array<String>, nil]
          #   # @param ids [Array<String>, nil]
          #   #
          #   def initialize(emails: nil, ids: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
