# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::DatasetsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.datasets.create(name: "x", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.datasets.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_update
    response = @braintrust.datasets.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_list
    response = @braintrust.datasets.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Dataset
    end

    assert_pattern do
      row => {
        id: String,
        name: String,
        project_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_delete
    response = @braintrust.datasets.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        project_id: String,
        created: Time | nil,
        deleted_at: Time | nil,
        description: String | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        user_id: String | nil
      }
    end
  end

  def test_feedback_required_params
    response = @braintrust.datasets.feedback("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", feedback: [{id: "id"}])

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
    response = @braintrust.datasets.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::FetchDatasetEventsResponse
    end

    assert_pattern do
      response => {
        events: ^(Braintrust::Internal::Type::ArrayOf[Braintrust::DatasetEvent]),
        cursor: String | nil
      }
    end
  end

  def test_fetch_post
    response = @braintrust.datasets.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::FetchDatasetEventsResponse
    end

    assert_pattern do
      response => {
        events: ^(Braintrust::Internal::Type::ArrayOf[Braintrust::DatasetEvent]),
        cursor: String | nil
      }
    end
  end

  def test_insert_required_params
    response = @braintrust.datasets.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", events: [{}])

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
    response = @braintrust.datasets.summarize("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::SummarizeDatasetResponse
    end

    assert_pattern do
      response => {
        dataset_name: String,
        dataset_url: String,
        project_name: String,
        project_url: String,
        data_summary: Braintrust::DataSummary | nil
      }
    end
  end
end
