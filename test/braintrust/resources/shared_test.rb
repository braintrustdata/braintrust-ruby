# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::SharedTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end
end
