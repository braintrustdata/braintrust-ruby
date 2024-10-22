# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::EnvVarsTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create_required_params
    response = @braintrust.env_vars.create(
      {name: "name", object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: "organization"}
    )
    assert_kind_of(Braintrust::Models::EnvVar, response)
  end

  def test_retrieve
    response = @braintrust.env_vars.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::EnvVar, response)
  end

  def test_update_required_params
    response = @braintrust.env_vars.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {name: "name"})
    assert_kind_of(Braintrust::Models::EnvVar, response)
  end

  def test_list
    response = @braintrust.env_vars.list
    assert_kind_of(Braintrust::Models::EnvVarListResponse, response)
  end

  def test_delete
    response = @braintrust.env_vars.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::EnvVar, response)
  end

  def test_replace_required_params
    response = @braintrust.env_vars.replace(
      {name: "name", object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: "organization"}
    )
    assert_kind_of(Braintrust::Models::EnvVar, response)
  end
end
