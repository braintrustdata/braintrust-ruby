# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      class Members
        # @param client [Braintrust::Client]
        def initialize(client:)
          @client = client
        end

        # Modify organization membership
        #
        # @param params [Hash{Symbol => Object}] Attributes to send in this request.
        #   @option params [InviteUsers, nil] :invite_users Users to invite to the organization
        #   @option params [String, nil] :org_id For nearly all users, this parameter should be unnecessary. But in the rare case
        #     that your API key belongs to multiple organizations, or in case you want to
        #     explicitly assert the organization you are modifying, you may specify the id of
        #     the organization.
        #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
        #     that your API key belongs to multiple organizations, or in case you want to
        #     explicitly assert the organization you are modifying, you may specify the name
        #     of the organization.
        #   @option params [RemoveUsers, nil] :remove_users Users to remove from the organization
        #
        # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Braintrust::Models::PatchOrganizationMembersOutput]
        def update(params = {}, opts = {})
          req = {
            method: :patch,
            path: "/v1/organization/members",
            body: params,
            headers: {"Content-Type" => "application/json"},
            model: Braintrust::Models::PatchOrganizationMembersOutput
          }
          @client.request(req, opts)
        end
      end
    end
  end
end
