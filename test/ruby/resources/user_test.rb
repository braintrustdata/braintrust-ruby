# frozen_string_literal: true

require_relative "../test_helper"

class Ruby::Test::Resources::UserTest < Test::Unit::TestCase
  def setup
    @braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_retrieve
    response = @braintrust.user.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Ruby::Models::User, response)
  end

  def test_list
    response = @braintrust.user.list 
    assert_kind_of(Ruby::ListObjects, response)
  end
end
