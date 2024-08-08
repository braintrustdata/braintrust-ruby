# frozen_string_literal: true

module Braintrust
  module Resources
    class Organizations
      class Members
        def initialize(client:)
          @client = client
        end

        # Modify organization membership
        #
        # @param params [Hash] Attributes to send in this request.
        # @option params [InviteUsers] :invite_users Users to invite to the organization
        # @option params [String] :org_id For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, or in case you want to
        #   explicitly assert the organization you are modifying, you may specify the id of
        #   the organization.
        # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, or in case you want to
        #   explicitly assert the organization you are modifying, you may specify the name
        #   of the organization.
        # @option params [RemoveUsers] :remove_users Users to remove from the organization
        #
        # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Braintrust::Models::MemberUpdateResponse]
        def update(params = {}, opts = {})
          req = {}
          req[:method] = :patch
          req[:path] = "/v1/organization/members"
          req[:body] = params
          req[:model] = Braintrust::Models::MemberUpdateResponse
          @client.request(req, opts)
        end
      end
    end
  end
end
