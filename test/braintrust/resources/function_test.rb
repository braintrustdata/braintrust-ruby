# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::FunctionTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.function.create(
      {function_data: {"type" => "prompt"}, name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "slug"}
    )
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_retrieve
    response = @braintrust.function.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_update
    response = @braintrust.function.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_list
    response = @braintrust.function.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.function.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Function, response)
  end

  def test_replace_required_params
    response = @braintrust.function.replace(
      {function_data: {"type" => "prompt"}, name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "slug"}
    )
    assert_kind_of(Braintrust::Models::Function, response)
  end
end
