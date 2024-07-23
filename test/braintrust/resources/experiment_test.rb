# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ExperimentTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.experiment.create({project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e"})
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_retrieve
    response = @braintrust.experiment.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_update
    response = @braintrust.experiment.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_list
    response = @braintrust.experiment.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.experiment.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_feedback_required_params
    response = @braintrust.experiment.feedback(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {feedback: [{"id" => "id"}, {"id" => "id"}, {"id" => "id"}]}
    )
    assert_nil(response)
  end

  def test_fetch
    response = @braintrust.experiment.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ExperimentFetchResponse, response)
  end

  def test_fetch_post
    response = @braintrust.experiment.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ExperimentFetchPostResponse, response)
  end

  def test_insert_required_params
    response = @braintrust.experiment.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {events: [{}, {}, {}]})
    assert_kind_of(Braintrust::Models::ExperimentInsertResponse, response)
  end

  def test_summarize
    response = @braintrust.experiment.summarize("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ExperimentSummarizeResponse, response)
  end
end
