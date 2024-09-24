# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::FunctionsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.functions.create(
      {function_data: {"type" => "prompt"}, name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "slug"}
    )
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_retrieve
    response = @braintrust.functions.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_update
    response = @braintrust.functions.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_list
    response = @braintrust.functions.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.functions.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_invoke
    response = @braintrust.functions.invoke("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    refute_nil(Object, response)
  end

  def test_replace_required_params
    response = @braintrust.functions.replace(
      {function_data: {"type" => "prompt"}, name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "slug"}
    )
    assert_kind_of(Braintrust::Models::Function, response)
  end
end
