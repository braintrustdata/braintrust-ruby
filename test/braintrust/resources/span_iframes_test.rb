# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::SpanIframesTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.span_iframes.create(
        name: "name",
        project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        url: "url"
      )

    assert_pattern do
      response => Braintrust::SpanIFrame
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        url: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        post_message: Braintrust::Internal::Type::Boolean | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.span_iframes.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::SpanIFrame
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        url: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        post_message: Braintrust::Internal::Type::Boolean | nil,
        user_id: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.span_iframes.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::SpanIFrame
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        url: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        post_message: Braintrust::Internal::Type::Boolean | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.span_iframes.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::SpanIFrame
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        project_id: String,
        url: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        post_message: Braintrust::Internal::Type::Boolean | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.span_iframes.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::SpanIFrame
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        url: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        post_message: Braintrust::Internal::Type::Boolean | nil,
        user_id: String | nil
      }
    end
  end

  def test_replace_required_params
    response =
      @braintrust.span_iframes.replace(
        name: "name",
        project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        url: "url"
      )

    assert_pattern do
      response => Braintrust::SpanIFrame
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        url: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        post_message: Braintrust::Internal::Type::Boolean | nil,
        user_id: String | nil
      }
    end
  end
end
