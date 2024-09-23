# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::AISecretTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.ai_secret.create({name: "name"})
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_retrieve
    response = @braintrust.ai_secret.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_update
    response = @braintrust.ai_secret.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_list
    response = @braintrust.ai_secret.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.ai_secret.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_find_and_delete_required_params
    response = @braintrust.ai_secret.find_and_delete({name: "name"})
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_replace_required_params
    response = @braintrust.ai_secret.replace({name: "name"})
    assert_kind_of(Braintrust::Models::AISecret, response)
  end
end
