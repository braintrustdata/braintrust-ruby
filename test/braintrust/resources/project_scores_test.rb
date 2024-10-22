# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectScoresTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create_required_params
    response = @braintrust.project_scores.create(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", score_type: "slider"}
    )
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_retrieve
    response = @braintrust.project_scores.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_update
    response = @braintrust.project_scores.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_list
    response = @braintrust.project_scores.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.project_scores.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_replace_required_params
    response = @braintrust.project_scores.replace(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", score_type: "slider"}
    )
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end
end
