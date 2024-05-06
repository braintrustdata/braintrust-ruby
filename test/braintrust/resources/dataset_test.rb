# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::DatasetTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.dataset.create({name: "string"})
    assert_kind_of(Braintrust::Models::Dataset, response)
  end

  def test_retrieve
    response = @braintrust.dataset.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Dataset, response)
  end

  def test_update_required_params
    response = @braintrust.dataset.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {name: "string"})
    assert_kind_of(Braintrust::Models::Dataset, response)
  end

  def test_list
    response = @braintrust.dataset.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.dataset.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Dataset, response)
  end

  def test_feedback_required_params
    response = @braintrust.dataset.feedback(
      "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      {feedback: [{"id" => "string"}, {"id" => "string"}, {"id" => "string"}]}
    )
    assert_nil(response)
  end

  def test_fetch
    response = @braintrust.dataset.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::DatasetFetchResponse, response)
  end

  def test_fetch_post
    response = @braintrust.dataset.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::DatasetFetchPostResponse, response)
  end

  def test_insert_required_params
    response = @braintrust.dataset.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {events: [{}, {}, {}]})
    assert_kind_of(Braintrust::Models::DatasetInsertResponse, response)
  end

  def test_replace_required_params
    response = @braintrust.dataset.replace({name: "string"})
    assert_kind_of(Braintrust::Models::Dataset, response)
  end
end
