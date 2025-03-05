# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::RolesTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.roles.create(name: "x")

    assert_pattern do
      response => Braintrust::Models::Role
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_permissions: ^(Braintrust::ArrayOf[Braintrust::Models::Role::MemberPermission]) | nil,
        member_roles: ^(Braintrust::ArrayOf[String]) | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.roles.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Role
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_permissions: ^(Braintrust::ArrayOf[Braintrust::Models::Role::MemberPermission]) | nil,
        member_roles: ^(Braintrust::ArrayOf[String]) | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.roles.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Role
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_permissions: ^(Braintrust::ArrayOf[Braintrust::Models::Role::MemberPermission]) | nil,
        member_roles: ^(Braintrust::ArrayOf[String]) | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.roles.list

    assert_pattern do
      response => Braintrust::ListObjects
    end

    page = response.next_page
    assert_pattern do
      page => Braintrust::ListObjects
    end

    row = response.to_enum.first
    assert_pattern do
      row => Braintrust::Models::Role
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_permissions: ^(Braintrust::ArrayOf[Braintrust::Models::Role::MemberPermission]) | nil,
        member_roles: ^(Braintrust::ArrayOf[String]) | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.roles.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Role
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_permissions: ^(Braintrust::ArrayOf[Braintrust::Models::Role::MemberPermission]) | nil,
        member_roles: ^(Braintrust::ArrayOf[String]) | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_replace_required_params
    response = @braintrust.roles.replace(name: "x")

    assert_pattern do
      response => Braintrust::Models::Role
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        member_permissions: ^(Braintrust::ArrayOf[Braintrust::Models::Role::MemberPermission]) | nil,
        member_roles: ^(Braintrust::ArrayOf[String]) | nil,
        org_id: String | nil,
        user_id: String | nil
      }
    end
  end
end
