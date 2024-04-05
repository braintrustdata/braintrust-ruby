# frozen_string_literal: true

require_relative "test_helper"

class BraintrustTest < Test::Unit::TestCase
  def test_raises_on_both_base_url_and_environment
    assert_raise_with_message(ArgumentError, /both environment and base_url given/) do
      Braintrust::Client.new(
        base_url: "https://localhost:8000",
        environment: "production"
      )
    end
  end

  def test_raises_on_unknown_environment
    assert_raise_with_message(ArgumentError, /environment must be one of/) do
      Braintrust::Client.new(environment: "wrong")
    end
  end

  def test_raises_on_missing_non_nullable_opts
    assert_raise_with_message(ArgumentError, /is required/) do
      Braintrust::Client.new
    end
  end

  class MockResponse
    attr_accessor :code, :header, :body, :content_type

    def initialize(code)
      self.code = code
      self.header = {}
      self.body = "{}"
      self.content_type = "application/json"
    end
  end

  class MockRequester
    attr_accessor :response_code, :attempts

    def initialize(response_code)
      self.response_code = response_code
      self.attempts = []
    end

    def execute(req)
      self.attempts.push(req)
      MockResponse.new(self.response_code)
    end
  end

  def test_client_default_request_default_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500)
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) { braintrust.project.create({name: "string", }) }
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500)
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) { braintrust.project.create({name: "string", }) }
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500)
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) { braintrust.project.create({name: "string", }, max_retries: 3) }
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500)
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) { braintrust.project.create({name: "string", }, max_retries: 4) }
    assert_equal(5, requester.attempts.length)
  end

  def test_default_headers
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(200)
    braintrust.requester = requester
    braintrust.project.create({name: "string", })
    headers = requester.attempts[0][:headers]
    assert_not_empty(headers["X-Stainless-Lang"])
    assert_not_empty(headers["X-Stainless-Package-Version"])
    assert_not_empty(headers["X-Stainless-Runtime"])
    assert_not_empty(headers["X-Stainless-Runtime-Version"])
  end
end
