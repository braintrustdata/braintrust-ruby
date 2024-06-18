# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::RoleTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.role.create({name: "string"})
    assert_kind_of(Braintrust::Models::Role, response)
  end

  def test_retrieve
    response = @braintrust.role.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Role, response)
  end

  def test_update
    response = @braintrust.role.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Role, response)
  end

  def test_list
    response = @braintrust.role.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.role.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Role, response)
  end

  def test_replace_required_params
    response = @braintrust.role.replace({name: "string"})
    assert_kind_of(Braintrust::Models::Role, response)
  end
end
