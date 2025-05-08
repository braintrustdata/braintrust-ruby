# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      class Members
        # Some parameter documentations has been truncated, see
        # {Braintrust::Models::Organizations::MemberUpdateParams} for more details.
        #
        # Modify organization membership
        #
        # @overload update(invite_users: nil, org_id: nil, org_name: nil, remove_users: nil, request_options: {})
        #
        # @param invite_users [Braintrust::Organizations::MemberUpdateParams::InviteUsers, nil] Users to invite to the organization
        #
        # @param org_id [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
        #
        # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
        #
        # @param remove_users [Braintrust::Organizations::MemberUpdateParams::RemoveUsers, nil] Users to remove from the organization
        #
        # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Braintrust::PatchOrganizationMembersOutput]
        #
        # @see Braintrust::Models::Organizations::MemberUpdateParams
        def update(params = {})
          parsed, options = Braintrust::Organizations::MemberUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: "v1/organization/members",
            body: parsed,
            model: Braintrust::PatchOrganizationMembersOutput,
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
