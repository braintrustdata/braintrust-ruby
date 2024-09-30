# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::EvalsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.evals.create(
      {
        data: {"dataset_id" => "dataset_id"},
        project_id: "project_id",
        scores: [
          {"function_id" => "function_id"},
          {"function_id" => "function_id"},
          {"function_id" => "function_id"}
        ],
        task: {"function_id" => "function_id"}
      }
    )
    assert_kind_of(Braintrust::Models::SummarizeExperimentResponse, response)
  end
end
