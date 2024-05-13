# frozen_string_literal: true

require_relative "test_helper"

class RubyTest < Test::Unit::TestCase
  def test_raises_on_missing_non_nullable_opts
    assert_raise_with_message(ArgumentError, /is required/) do
      Ruby::Client.new
    end
  end

  class MockResponse
    attr_accessor :code, :header, :body, :content_type

    def initialize(code, data)
      self.code = code
      self.header = {}
      self.body = JSON.generate(data)
      self.content_type = "application/json"
    end
  end

  class MockRequester
    attr_accessor :response_code, :response_data, :attempts

    def initialize(response_code, response_data)
      self.response_code = response_code
      self.response_data = response_data
      self.attempts = []
    end

    def execute(req)
      attempts.push(req)
      MockResponse.new(response_code, response_data)
    end
  end

  def test_client_default_request_default_retry_attempts
    braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {})
    braintrust.requester = requester
    assert_raise(Ruby::HTTP::InternalServerError) do
      braintrust.project.create({name: "string"})
    end
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {})
    braintrust.requester = requester
    assert_raise(Ruby::HTTP::InternalServerError) do
      braintrust.project.create({name: "string"})
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {})
    braintrust.requester = requester
    assert_raise(Ruby::HTTP::InternalServerError) do
      braintrust.project.create({name: "string"}, max_retries: 3)
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {})
    braintrust.requester = requester
    assert_raise(Ruby::HTTP::InternalServerError) do
      braintrust.project.create({name: "string"}, max_retries: 4)
    end
    assert_equal(5, requester.attempts.length)
  end

  def test_default_headers
    braintrust = Ruby::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(200, {})
    braintrust.requester = requester
    braintrust.project.create({name: "string"})
    headers = requester.attempts[0][:headers]
    assert_not_empty(headers["X-Stainless-Lang"])
    assert_not_empty(headers["X-Stainless-Package-Version"])
    assert_not_empty(headers["X-Stainless-Runtime"])
    assert_not_empty(headers["X-Stainless-Runtime-Version"])
  end
end
