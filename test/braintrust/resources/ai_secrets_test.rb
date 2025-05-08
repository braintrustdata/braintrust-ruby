# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::AISecretsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.ai_secrets.create(name: "name")

    assert_pattern do
      response => Braintrust::AISecret
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.ai_secrets.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::AISecret
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_update
    response = @braintrust.ai_secrets.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::AISecret
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_list
    response = @braintrust.ai_secrets.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::AISecret
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_delete
    response = @braintrust.ai_secrets.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::AISecret
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_find_and_delete_required_params
    response = @braintrust.ai_secrets.find_and_delete(name: "name")

    assert_pattern do
      response => Braintrust::AISecret
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_replace_required_params
    response = @braintrust.ai_secrets.replace(name: "name")

    assert_pattern do
      response => Braintrust::AISecret
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        org_id: String,
        created: Time | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        preview_secret: String | nil,
        type: String | nil,
        updated_at: Time | nil
      }
    end
  end
end
