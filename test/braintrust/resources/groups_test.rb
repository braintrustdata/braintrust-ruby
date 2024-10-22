# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::GroupsTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create_required_params
    response = @braintrust.groups.create({name: "name"})
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_retrieve
    response = @braintrust.groups.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_update
    response = @braintrust.groups.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_list
    response = @braintrust.groups.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.groups.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_replace_required_params
    response = @braintrust.groups.replace({name: "name"})
    assert_kind_of(Braintrust::Models::Group, response)
  end
end
