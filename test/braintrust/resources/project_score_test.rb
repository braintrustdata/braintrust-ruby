# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ProjectScoreTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.project_score.create(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", score_type: "slider"}
    )
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_retrieve
    response = @braintrust.project_score.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_update
    response = @braintrust.project_score.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_list
    response = @braintrust.project_score.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.project_score.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end

  def test_replace_required_params
    response = @braintrust.project_score.replace(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", score_type: "slider"}
    )
    assert_kind_of(Braintrust::Models::ProjectScore, response)
  end
end
