# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      class Members
        # Modify organization membership
        #
        # @overload update(invite_users: nil, org_id: nil, org_name: nil, remove_users: nil, request_options: {})
        #
        # @param invite_users [Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, nil]
        # @param org_id [String, nil]
        # @param org_name [String, nil]
        # @param remove_users [Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, nil]
        # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
