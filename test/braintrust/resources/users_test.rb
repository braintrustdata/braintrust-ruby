# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::UsersTest < Braintrust::Test::ResourceTest
  def test_retrieve
    response = @braintrust.users.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::User
    end

    assert_pattern do
      response => {
        id: String,
        avatar_url: String | nil,
        created: Time | nil,
        email: String | nil,
        family_name: String | nil,
        given_name: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.users.list

    assert_pattern do
      response => Braintrust::ListObjects
    end

    row = response.to_enum.first
    assert_pattern do
      row => Braintrust::Models::User
    end

    assert_pattern do
      row => {
        id: String,
        avatar_url: String | nil,
        created: Time | nil,
        email: String | nil,
        family_name: String | nil,
        given_name: String | nil
      }
    end
  end
end
