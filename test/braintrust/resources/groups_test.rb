# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::GroupsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.groups.create(name: "x")

    assert_pattern do
      response => Braintrust::Models::Group
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_groups: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        member_users: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.groups.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Group
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_groups: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        member_users: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.groups.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Group
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_groups: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        member_users: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.groups.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Models::Group
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_groups: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        member_users: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.groups.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Group
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_groups: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        member_users: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_replace_required_params
    response = @braintrust.groups.replace(name: "x")

    assert_pattern do
      response => Braintrust::Models::Group
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_groups: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        member_users: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil,
        user_id: String | nil
      }
    end
  end
end
