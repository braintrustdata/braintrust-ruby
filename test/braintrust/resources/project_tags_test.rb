# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectTagsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.project_tags.create(name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ProjectTag
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        user_id: String,
        color: String | nil,
        created: Time | nil,
        description: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.project_tags.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ProjectTag
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        user_id: String,
        color: String | nil,
        created: Time | nil,
        description: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.project_tags.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ProjectTag
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        user_id: String,
        color: String | nil,
        created: Time | nil,
        description: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.project_tags.list

    assert_pattern do
      response => Braintrust::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Models::ProjectTag
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        project_id: String,
        user_id: String,
        color: String | nil,
        created: Time | nil,
        description: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.project_tags.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ProjectTag
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        user_id: String,
        color: String | nil,
        created: Time | nil,
        description: String | nil
      }
    end
  end

  def test_replace_required_params
    response =
      @braintrust.project_tags.replace(name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ProjectTag
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        user_id: String,
        color: String | nil,
        created: Time | nil,
        description: String | nil
      }
    end
  end
end
