# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::EnvVarsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.env_vars.create(
        name: "name",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization
      )

    assert_pattern do
      response => Braintrust::Models::EnvVar
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::EnvVar::ObjectType,
        created: Time | nil,
        used: Time | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.env_vars.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::EnvVar
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::EnvVar::ObjectType,
        created: Time | nil,
        used: Time | nil
      }
    end
  end

  def test_update_required_params
    response = @braintrust.env_vars.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", name: "name")

    assert_pattern do
      response => Braintrust::Models::EnvVar
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::EnvVar::ObjectType,
        created: Time | nil,
        used: Time | nil
      }
    end
  end

  def test_list
    response = @braintrust.env_vars.list

    assert_pattern do
      response => Braintrust::Models::EnvVarListResponse
    end

    assert_pattern do
      response => {
        objects: ^(Braintrust::ArrayOf[Braintrust::Models::EnvVar])
      }
    end
  end

  def test_delete
    response = @braintrust.env_vars.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::EnvVar
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::EnvVar::ObjectType,
        created: Time | nil,
        used: Time | nil
      }
    end
  end

  def test_replace_required_params
    response =
      @braintrust.env_vars.replace(
        name: "name",
        object_id_: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: :organization
      )

    assert_pattern do
      response => Braintrust::Models::EnvVar
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        object_id_: String,
        object_type: Braintrust::Models::EnvVar::ObjectType,
        created: Time | nil,
        used: Time | nil
      }
    end
  end
end
