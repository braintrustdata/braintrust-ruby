# frozen_string_literal: true

require_relative "../../test_helper"

class Braintrust::Test::Resources::LogsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_feedback_required_params
    response = @braintrust.project.logs.feedback(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {feedback: [{"id" => "id"}, {"id" => "id"}, {"id" => "id"}]}
    )
    assert_kind_of(Braintrust::Models::FeedbackResponseSchema, response)
  end

  def test_fetch
    response = @braintrust.project.logs.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::FetchProjectLogsEventsResponse, response)
  end

  def test_fetch_post
    response = @braintrust.project.logs.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::FetchProjectLogsEventsResponse, response)
  end

  def test_insert_required_params
    response = @braintrust.project.logs.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {events: [{}, {}, {}]})
    assert_kind_of(Braintrust::Models::InsertEventsResponse, response)
  end
end
