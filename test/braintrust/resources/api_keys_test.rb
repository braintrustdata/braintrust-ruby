# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::APIKeysTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.api_keys.create(name: "name")

    assert_pattern do
      response => Braintrust::CreateAPIKeyOutput
    end

    assert_pattern do
      response => {
        id: String,
        key: String,
        name: String,
        preview_name: String,
        created: Time | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.api_keys.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::APIKey
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        preview_name: String,
        created: Time | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.api_keys.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::APIKey
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        preview_name: String,
        created: Time | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.api_keys.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::APIKey
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        preview_name: String,
        created: Time | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end
end
