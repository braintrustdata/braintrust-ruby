# typed: strong

module Braintrust
  module Resources
    class Organizations
      class Members
        # Modify organization membership
        sig do
          params(
            invite_users: T.nilable(
              T.any(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, Braintrust::Internal::AnyHash)
            ),
            org_id: T.nilable(String),
            org_name: T.nilable(String),
            remove_users: T.nilable(
              T.any(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, Braintrust::Internal::AnyHash)
            ),
            request_options: Braintrust::RequestOpts
          )
            .returns(Braintrust::Models::PatchOrganizationMembersOutput)
        end
        def update(
          # Users to invite to the organization
          invite_users: nil,
          # For nearly all users, this parameter should be unnecessary. But in the rare case
          # that your API key belongs to multiple organizations, or in case you want to
          # explicitly assert the organization you are modifying, you may specify the id of
          # the organization.
          org_id: nil,
          # For nearly all users, this parameter should be unnecessary. But in the rare case
          # that your API key belongs to multiple organizations, or in case you want to
          # explicitly assert the organization you are modifying, you may specify the name
          # of the organization.
          org_name: nil,
          # Users to remove from the organization
          remove_users: nil,
          request_options: {}
        ); end
        # @api private
        sig { params(client: Braintrust::Client).returns(T.attached_class) }
        def self.new(client:); end
      end
    end
  end
end
