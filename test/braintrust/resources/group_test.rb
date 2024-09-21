# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::GroupTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.group.create({name: "name"})
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_retrieve
    response = @braintrust.group.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_update
    response = @braintrust.group.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_list
    response = @braintrust.group.list 
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.group.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::Group, response)
  end

  def test_replace_required_params
    response = @braintrust.group.replace({name: "name"})
    assert_kind_of(Braintrust::Models::Group, response)
  end
end
