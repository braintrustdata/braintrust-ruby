# frozen_string_literal: true

require_relative "../../test_helper"

class Braintrust::Test::Resources::Organizations::MembersTest < Braintrust::Test::ResourceTest
  def test_update
    response = @braintrust.organizations.members.update

    assert_pattern do
      response => Braintrust::Models::PatchOrganizationMembersOutput
    end

    assert_pattern do
      response => {
        org_id: String,
        status: Braintrust::Models::PatchOrganizationMembersOutput::Status,
        send_email_error: String | nil
      }
    end
  end
end
