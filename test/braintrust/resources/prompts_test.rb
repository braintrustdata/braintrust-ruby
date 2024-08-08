# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::PromptsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.prompts.create(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "slug"}
    )
    assert_kind_of(Braintrust::Models::Prompt, response)
  end

  def test_retrieve
    response = @braintrust.prompts.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Prompt, response)
  end

  def test_update
    response = @braintrust.prompts.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Prompt, response)
  end

  def test_list
    response = @braintrust.prompts.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.prompts.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Prompt, response)
  end

  def test_replace_required_params
    response = @braintrust.prompts.replace(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "slug"}
    )
    assert_kind_of(Braintrust::Models::Prompt, response)
  end
end
