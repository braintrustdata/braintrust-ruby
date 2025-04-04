# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ACLsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.acls.create(object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: :organization)

    assert_pattern do
      response => Braintrust::Models::ACL
    end

    assert_pattern do
      response => {
        id: String,
        _object_org_id: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        created: Time | nil,
        group_id: String | nil,
        permission: Braintrust::Models::Permission | nil,
        restrict_object_type: Braintrust::Models::ACLObjectType | nil,
        role_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.acls.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ACL
    end

    assert_pattern do
      response => {
        id: String,
        _object_org_id: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        created: Time | nil,
        group_id: String | nil,
        permission: Braintrust::Models::Permission | nil,
        restrict_object_type: Braintrust::Models::ACLObjectType | nil,
        role_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_list_required_params
    response =
      @braintrust.acls.list(object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", object_type: :organization)

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Models::ACL
    end

    assert_pattern do
      row => {
        id: String,
        _object_org_id: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        created: Time | nil,
        group_id: String | nil,
        permission: Braintrust::Models::Permission | nil,
        restrict_object_type: Braintrust::Models::ACLObjectType | nil,
        role_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.acls.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::ACL
    end

    assert_pattern do
      response => {
        id: String,
        _object_org_id: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        created: Time | nil,
        group_id: String | nil,
        permission: Braintrust::Models::Permission | nil,
        restrict_object_type: Braintrust::Models::ACLObjectType | nil,
        role_id: String | nil,
        user_id: String | nil
      }
    end
  end

  def test_batch_update
    response = @braintrust.acls.batch_update

    assert_pattern do
      response => Braintrust::Models::ACLBatchUpdateResponse
    end

    assert_pattern do
      response => {
        added_acls: ^(Braintrust::ArrayOf[Braintrust::Models::ACL]),
        removed_acls: ^(Braintrust::ArrayOf[Braintrust::Models::ACL])
      }
    end
  end

  def test_find_and_delete_required_params
    response =
      @braintrust.acls.find_and_delete(
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization
      )

    assert_pattern do
      response => Braintrust::Models::ACL
    end

    assert_pattern do
      response => {
        id: String,
        _object_org_id: String,
        object_id_: String,
        object_type: Braintrust::Models::ACLObjectType,
        created: Time | nil,
        group_id: String | nil,
        permission: Braintrust::Models::Permission | nil,
        restrict_object_type: Braintrust::Models::ACLObjectType | nil,
        role_id: String | nil,
        user_id: String | nil
      }
    end
  end
end
