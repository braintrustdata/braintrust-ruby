# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      class Members
        # Modify organization membership
        #
        # @param params [Hash{Symbol => Object}] Attributes to send in this request.
        #   @option params [Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, nil] :invite_users Users to invite to the organization
        #   @option params [String, nil] :org_id For nearly all users, this parameter should be unnecessary. But in the rare case
        #     that your API key belongs to multiple organizations, or in case you want to
        #     explicitly assert the organization you are modifying, you may specify the id of
        #     the organization.
        #
        #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
        #     that your API key belongs to multiple organizations, or in case you want to
        #     explicitly assert the organization you are modifying, you may specify the name
        #     of the organization.
        #
        #   @option params [Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, nil] :remove_users Users to remove from the organization
        #
        #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Braintrust::Models::PatchOrganizationMembersOutput]
        #
        # @see Braintrust::Models::Organizations::MemberUpdateParams
        def update(params = {})
          parsed, options = Braintrust::Models::Organizations::MemberUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: "v1/organization/members",
            body: parsed,
            model: Braintrust::Models::PatchOrganizationMembersOutput,
            options: options
          )
        end

        # @api private
        #
        # @param client [Braintrust::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
