# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.projects.create(name: "x")

    assert_pattern do
      response => Braintrust::Models::Project
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        settings: Braintrust::Models::ProjectSettings | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.projects.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Project
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        settings: Braintrust::Models::ProjectSettings | nil,
        user_id: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.projects.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Project
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        settings: Braintrust::Models::ProjectSettings | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.projects.list

    assert_pattern do
      response => Braintrust::ListObjects
    end

    page = response.next_page
    assert_pattern do
      page => Braintrust::ListObjects
    end

    row = response.to_enum.first
    assert_pattern do
      row => Braintrust::Models::Project
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        settings: Braintrust::Models::ProjectSettings | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.projects.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Project
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        settings: Braintrust::Models::ProjectSettings | nil,
        user_id: String | nil
      }
    end
  end
end
