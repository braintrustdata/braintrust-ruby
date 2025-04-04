# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::OrganizationsTest < Braintrust::Test::ResourceTest
  def test_retrieve
    response = @braintrust.organizations.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Organization
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        api_url: String | nil,
        created: Time | nil,
        is_universal_api: Braintrust::BooleanModel | nil,
        proxy_url: String | nil,
        realtime_url: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.organizations.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Organization
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        api_url: String | nil,
        created: Time | nil,
        is_universal_api: Braintrust::BooleanModel | nil,
        proxy_url: String | nil,
        realtime_url: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.organizations.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Models::Organization
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        api_url: String | nil,
        created: Time | nil,
        is_universal_api: Braintrust::BooleanModel | nil,
        proxy_url: String | nil,
        realtime_url: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.organizations.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Organization
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        api_url: String | nil,
        created: Time | nil,
        is_universal_api: Braintrust::BooleanModel | nil,
        proxy_url: String | nil,
        realtime_url: String | nil
      }
    end
  end
end
