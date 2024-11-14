# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::SpanIframesTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_create_required_params
    response = @braintrust.span_iframes.create(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", url: "url"}
    )
    assert_kind_of(Braintrust::Models::SpanIFrame, response)
  end

  def test_retrieve
    response = @braintrust.span_iframes.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::SpanIFrame, response)
  end

  def test_update
    response = @braintrust.span_iframes.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::SpanIFrame, response)
  end

  def test_list
    response = @braintrust.span_iframes.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.span_iframes.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::SpanIFrame, response)
  end

  def test_replace_required_params
    response = @braintrust.span_iframes.replace(
      {name: "name", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", url: "url"}
    )
    assert_kind_of(Braintrust::Models::SpanIFrame, response)
  end
end
