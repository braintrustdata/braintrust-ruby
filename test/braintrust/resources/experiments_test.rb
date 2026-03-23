# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ExperimentsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.experiments.create(project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Experiment
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        public: Braintrust::Internal::Type::Boolean,
        base_exp_id: String | nil,
        commit: String | nil,
        created: Time | nil,
        dataset_id: String | nil,
        dataset_version: String | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        repo_info: Braintrust::RepoInfo | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.experiments.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Experiment
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        public: Braintrust::Internal::Type::Boolean,
        base_exp_id: String | nil,
        commit: String | nil,
        created: Time | nil,
        dataset_id: String | nil,
        dataset_version: String | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        repo_info: Braintrust::RepoInfo | nil,
        user_id: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.experiments.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Experiment
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        public: Braintrust::Internal::Type::Boolean,
        base_exp_id: String | nil,
        commit: String | nil,
        created: Time | nil,
        dataset_id: String | nil,
        dataset_version: String | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        repo_info: Braintrust::RepoInfo | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.experiments.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Experiment
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        project_id: String,
        public: Braintrust::Internal::Type::Boolean,
        base_exp_id: String | nil,
        commit: String | nil,
        created: Time | nil,
        dataset_id: String | nil,
        dataset_version: String | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        repo_info: Braintrust::RepoInfo | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.experiments.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Experiment
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        public: Braintrust::Internal::Type::Boolean,
        base_exp_id: String | nil,
        commit: String | nil,
        created: Time | nil,
        dataset_id: String | nil,
        dataset_version: String | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        repo_info: Braintrust::RepoInfo | nil,
        user_id: String | nil
      }
    end
  end

  def test_feedback_required_params
    response =
      @braintrust.experiments.feedback("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", feedback: [{id: "id"}])

    assert_pattern do
      response => Braintrust::FeedbackResponseSchema
    end

    assert_pattern do
      response => {
        status: Braintrust::FeedbackResponseSchema::Status
      }
    end
  end

  def test_fetch
    response = @braintrust.experiments.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::FetchExperimentEventsResponse
    end

    assert_pattern do
      response => {
        events: ^(Braintrust::Internal::Type::ArrayOf[Braintrust::ExperimentEvent]),
        cursor: String | nil
      }
    end
  end

  def test_fetch_post
    response = @braintrust.experiments.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::FetchExperimentEventsResponse
    end

    assert_pattern do
      response => {
        events: ^(Braintrust::Internal::Type::ArrayOf[Braintrust::ExperimentEvent]),
        cursor: String | nil
      }
    end
  end

  def test_insert_required_params
    response = @braintrust.experiments.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", events: [{}])

    assert_pattern do
      response => Braintrust::InsertEventsResponse
    end

    assert_pattern do
      response => {
        row_ids: ^(Braintrust::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_summarize
    response = @braintrust.experiments.summarize("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::SummarizeExperimentResponse
    end

    assert_pattern do
      response => {
        experiment_name: String,
        experiment_url: String,
        project_name: String,
        project_url: String,
        comparison_experiment_name: String | nil,
        metrics: ^(Braintrust::Internal::Type::HashOf[Braintrust::MetricSummary]) | nil,
        scores: ^(Braintrust::Internal::Type::HashOf[Braintrust::ScoreSummary]) | nil
      }
    end
  end
end
