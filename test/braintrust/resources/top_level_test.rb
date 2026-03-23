# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::TopLevelTest < Braintrust::Test::ResourceTest
  def test_hello_world
    response = @braintrust.top_level.hello_world

    assert_pattern do
      response => String
    end
  end
end
