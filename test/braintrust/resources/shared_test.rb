# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::SharedTest < Minitest::Test
  parallelize_me!

  def setup
    @braintrust = Braintrust::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "My API Key"
    )
  end
end
