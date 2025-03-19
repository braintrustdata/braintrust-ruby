# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ViewsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.views.create(
        name: "name",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization,
        view_type: :projects
      )

    assert_pattern do
      response => Braintrust::Models::View
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        view_type: Braintrust::Models::View::ViewType | nil,
        created: Time | nil,
        deleted_at: Time | nil,
        options: Braintrust::Models::ViewOptions | nil,
        user_id: String | nil,
        view_data: Braintrust::Models::ViewData | nil
      }
    end
  end

  def test_retrieve_required_params
    response =
      @braintrust.views.retrieve(
        "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization
      )

    assert_pattern do
      response => Braintrust::Models::View
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        view_type: Braintrust::Models::View::ViewType | nil,
        created: Time | nil,
        deleted_at: Time | nil,
        options: Braintrust::Models::ViewOptions | nil,
        user_id: String | nil,
        view_data: Braintrust::Models::ViewData | nil
      }
    end
  end

  def test_update_required_params
    response =
      @braintrust.views.update(
        "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization
      )

    assert_pattern do
      response => Braintrust::Models::View
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        view_type: Braintrust::Models::View::ViewType | nil,
        created: Time | nil,
        deleted_at: Time | nil,
        options: Braintrust::Models::ViewOptions | nil,
        user_id: String | nil,
        view_data: Braintrust::Models::ViewData | nil
      }
    end
  end

  def test_list_required_params
    response =
      @braintrust.views.list(object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: :organization)

    assert_pattern do
      response => Braintrust::ListObjects
    end

    row = response.to_enum.first
    assert_pattern do
      row => Braintrust::Models::View
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        view_type: Braintrust::Models::View::ViewType | nil,
        created: Time | nil,
        deleted_at: Time | nil,
        options: Braintrust::Models::ViewOptions | nil,
        user_id: String | nil,
        view_data: Braintrust::Models::ViewData | nil
      }
    end
  end

  def test_delete_required_params
    response =
      @braintrust.views.delete(
        "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization
      )

    assert_pattern do
      response => Braintrust::Models::View
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        view_type: Braintrust::Models::View::ViewType | nil,
        created: Time | nil,
        deleted_at: Time | nil,
        options: Braintrust::Models::ViewOptions | nil,
        user_id: String | nil,
        view_data: Braintrust::Models::ViewData | nil
      }
    end
  end

  def test_replace_required_params
    response =
      @braintrust.views.replace(
        name: "name",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization,
        view_type: :projects
      )

    assert_pattern do
      response => Braintrust::Models::View
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        view_type: Braintrust::Models::View::ViewType | nil,
        created: Time | nil,
        deleted_at: Time | nil,
        options: Braintrust::Models::ViewOptions | nil,
        user_id: String | nil,
        view_data: Braintrust::Models::ViewData | nil
      }
    end
  end
end
