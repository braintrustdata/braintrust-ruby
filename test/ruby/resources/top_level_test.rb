# frozen_string_literal: true

require_relative "../test_helper"

class Ruby::Test::Resources::TopLevelTest < Test::Unit::TestCase
  def setup
    @braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_hello_world
    response = @braintrust.top_level.hello_world 
    assert_kind_of(String, response)
  end
end
