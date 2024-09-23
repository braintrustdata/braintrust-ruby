# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.project.create({name: "name"})
    assert_kind_of(Braintrust::Models::ProjectModel, response)
  end

  def test_retrieve
    response = @braintrust.project.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectModel, response)
  end

  def test_update
    response = @braintrust.project.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectModel, response)
  end

  def test_list
    response = @braintrust.project.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.project.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectModel, response)
  end
end
