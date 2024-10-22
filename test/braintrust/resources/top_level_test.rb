# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::TopLevelTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end

  def test_hello_world
    response = @braintrust.top_level.hello_world
    assert_kind_of(String, response)
  end
end
