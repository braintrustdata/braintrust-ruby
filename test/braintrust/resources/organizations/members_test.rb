# frozen_string_literal: true

require_relative "../../test_helper"

class Braintrust::Test::Resources::Organizations::MembersTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_update
    response = @braintrust.organizations.members.update
    assert_kind_of(Braintrust::Models::PatchOrganizationMembersOutput, response)
  end
end
