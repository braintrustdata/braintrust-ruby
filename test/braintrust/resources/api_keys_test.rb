# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::APIKeysTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create_required_params
    response = @braintrust.api_keys.create({name: "name"})
    assert_kind_of(Braintrust::Models::CreateAPIKeyOutput, response)
  end

  def test_retrieve
    response = @braintrust.api_keys.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::APIKey, response)
  end

  def test_list
    response = @braintrust.api_keys.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.api_keys.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::APIKey, response)
  end
end
