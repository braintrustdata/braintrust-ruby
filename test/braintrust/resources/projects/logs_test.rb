# frozen_string_literal: true

require_relative "../../test_helper"

class Braintrust::Test::Resources::Projects::LogsTest < Braintrust::Test::ResourceTest
  def test_feedback_required_params
    response =
      @braintrust.projects.logs.feedback("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", feedback: [{id: "id"}])

    assert_pattern do
      response => Braintrust::Models::FeedbackResponseSchema
    end

    assert_pattern do
      response => {
        status: Braintrust::Models::FeedbackResponseSchema::Status
      }
    end
  end

  def test_fetch
    response = @braintrust.projects.logs.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::FetchProjectLogsEventsResponse
    end

    assert_pattern do
      response => {
        events: ^(Braintrust::ArrayOf[Braintrust::Models::ProjectLogsEvent]),
        cursor: String | nil
      }
    end
  end

  def test_fetch_post
    response = @braintrust.projects.logs.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::FetchProjectLogsEventsResponse
    end

    assert_pattern do
      response => {
        events: ^(Braintrust::ArrayOf[Braintrust::Models::ProjectLogsEvent]),
        cursor: String | nil
      }
    end
  end

  def test_insert_required_params
    response = @braintrust.projects.logs.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", events: [{}])

    assert_pattern do
      response => Braintrust::Models::InsertEventsResponse
    end

    assert_pattern do
      response => {
        row_ids: ^(Braintrust::ArrayOf[String])
      }
    end
  end
end
