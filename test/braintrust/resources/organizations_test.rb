# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::OrganizationsTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_retrieve
    response = @braintrust.organizations.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Organization, response)
  end

  def test_update
    response = @braintrust.organizations.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Organization, response)
  end

  def test_list
    response = @braintrust.organizations.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.organizations.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Organization, response)
  end
end
