# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ViewsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.views.create(
      {
        name: "name",
        object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: "organization",
        view_type: "projects"
      }
    )
    assert_kind_of(Braintrust::Models::View, response)
  end

  def test_retrieve_required_params
    response = @braintrust.views.retrieve(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: "organization"}
    )
    assert_kind_of(Braintrust::Models::View, response)
  end

  def test_update_required_params
    response = @braintrust.views.update(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: "organization"}
    )
    assert_kind_of(Braintrust::Models::View, response)
  end

  def test_list_required_params
    response = @braintrust.views.list(
      {
        object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: "organization"
      }
    )
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete_required_params
    response = @braintrust.views.delete(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: "organization"}
    )
    assert_kind_of(Braintrust::Models::View, response)
  end

  def test_replace_required_params
    response = @braintrust.views.replace(
      {
        name: "name",
        object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: "organization",
        view_type: "projects"
      }
    )
    assert_kind_of(Braintrust::Models::View, response)
  end
end
