# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::UsersTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @braintrust.users.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::User, response)
  end

  def test_list
    response = @braintrust.users.list
    assert_kind_of(Braintrust::ListObjects, response)
  end
end
