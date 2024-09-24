# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ExperimentsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.experiments.create({project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e"})
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_retrieve
    response = @braintrust.experiments.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_update
    response = @braintrust.experiments.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_list
    response = @braintrust.experiments.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.experiments.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Experiment, response)
  end

  def test_feedback_required_params
    response = @braintrust.experiments.feedback(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {feedback: [{"id" => "id"}, {"id" => "id"}, {"id" => "id"}]}
    )
    assert_kind_of(Braintrust::Models::FeedbackResponseSchema, response)
  end

  def test_fetch
    response = @braintrust.experiments.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::FetchExperimentEventsResponse, response)
  end

  def test_fetch_post
    response = @braintrust.experiments.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::FetchExperimentEventsResponse, response)
  end

  def test_insert_required_params
    response = @braintrust.experiments.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {events: [{}, {}, {}]})
    assert_kind_of(Braintrust::Models::InsertEventsResponse, response)
  end

  def test_summarize
    response = @braintrust.experiments.summarize("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::SummarizeExperimentResponse, response)
  end
end
