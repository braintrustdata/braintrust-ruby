# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectScoresTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.project_scores.create(
        name: "name",
        project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        score_type: :slider
      )

    assert_pattern do
      response => Braintrust::ProjectScore
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        score_type: Braintrust::ProjectScoreType,
        user_id: String,
        categories: Braintrust::ProjectScore::Categories | nil,
        config: Braintrust::ProjectScoreConfig | nil,
        created: Time | nil,
        description: String | nil,
        position: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.project_scores.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::ProjectScore
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        score_type: Braintrust::ProjectScoreType,
        user_id: String,
        categories: Braintrust::ProjectScore::Categories | nil,
        config: Braintrust::ProjectScoreConfig | nil,
        created: Time | nil,
        description: String | nil,
        position: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.project_scores.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::ProjectScore
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        score_type: Braintrust::ProjectScoreType,
        user_id: String,
        categories: Braintrust::ProjectScore::Categories | nil,
        config: Braintrust::ProjectScoreConfig | nil,
        created: Time | nil,
        description: String | nil,
        position: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.project_scores.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::ProjectScore
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        project_id: String,
        score_type: Braintrust::ProjectScoreType,
        user_id: String,
        categories: Braintrust::ProjectScore::Categories | nil,
        config: Braintrust::ProjectScoreConfig | nil,
        created: Time | nil,
        description: String | nil,
        position: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.project_scores.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::ProjectScore
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        score_type: Braintrust::ProjectScoreType,
        user_id: String,
        categories: Braintrust::ProjectScore::Categories | nil,
        config: Braintrust::ProjectScoreConfig | nil,
        created: Time | nil,
        description: String | nil,
        position: String | nil
      }
    end
  end

  def test_replace_required_params
    response =
      @braintrust.project_scores.replace(
        name: "name",
        project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        score_type: :slider
      )

    assert_pattern do
      response => Braintrust::ProjectScore
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        score_type: Braintrust::ProjectScoreType,
        user_id: String,
        categories: Braintrust::ProjectScore::Categories | nil,
        config: Braintrust::ProjectScoreConfig | nil,
        created: Time | nil,
        description: String | nil,
        position: String | nil
      }
    end
  end
end
