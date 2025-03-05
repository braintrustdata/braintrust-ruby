# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::EvalsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.evals.create(
      data: {dataset_id: "dataset_id"},
      project_id: "project_id",
      scores: [{function_id: "function_id"}],
      task: {function_id: "function_id"}
    )

    assert_pattern do
      response => Braintrust::Models::SummarizeExperimentResponse
    end

    assert_pattern do
      response => {
        experiment_name: String,
        experiment_url: String,
        project_name: String,
        project_url: String,
        comparison_experiment_name: String | nil,
        metrics: ^(Braintrust::HashOf[Braintrust::Models::MetricSummary]) | nil,
        scores: ^(Braintrust::HashOf[Braintrust::Models::ScoreSummary]) | nil
      }
    end
  end
end
