# typed: strong

module Braintrust
  module Resources
    class Organizations
      class Members
        # Modify organization membership
        sig do
          params(
            invite_users: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers),
            org_id: T.nilable(String),
            org_name: T.nilable(String),
            remove_users: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers),
            request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Braintrust::Models::PatchOrganizationMembersOutput)
        end
        def update(invite_users: nil, org_id: nil, org_name: nil, remove_users: nil, request_options: {})
        end

        sig { params(client: Braintrust::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
