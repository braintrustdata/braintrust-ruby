# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.projects.create({name: "name"})
    assert_kind_of(Braintrust::Models::Project, response)
  end

  def test_retrieve
    response = @braintrust.projects.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Project, response)
  end

  def test_update
    response = @braintrust.projects.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Project, response)
  end

  def test_list
    response = @braintrust.projects.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.projects.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Project, response)
  end
end
