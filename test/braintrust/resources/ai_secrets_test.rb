# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::AISecretsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.ai_secrets.create({name: "name"})
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_retrieve
    response = @braintrust.ai_secrets.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_update
    response = @braintrust.ai_secrets.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_list
    response = @braintrust.ai_secrets.list
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.ai_secrets.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_find_and_delete_required_params
    response = @braintrust.ai_secrets.find_and_delete({name: "name"})
    assert_kind_of(Braintrust::Models::AISecret, response)
  end

  def test_replace_required_params
    response = @braintrust.ai_secrets.replace({name: "name"})
    assert_kind_of(Braintrust::Models::AISecret, response)
  end
end
