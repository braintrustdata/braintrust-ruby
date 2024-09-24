# frozen_string_literal: true

require "time"

require_relative "test_helper"

class BraintrustTest < Test::Unit::TestCase
  class MockResponse
    attr_accessor :code, :header, :body, :content_type

    def initialize(code, data, headers)
      self.code = code
      self.header = headers
      self.body = JSON.generate(data)
      self.content_type = "application/json"
    end
  end

  class MockRequester
    attr_accessor :response_code, :response_data, :response_headers, :attempts

    def initialize(response_code, response_data, response_headers)
      self.response_code = response_code
      self.response_data = response_data
      self.response_headers = response_headers
      self.attempts = []
    end

    def execute(req)
      attempts.push(req)
      MockResponse.new(response_code, response_data, response_headers)
    end
  end

  def test_client_default_request_default_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"})
    end
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"})
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"}, max_retries: 3)
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 3)
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"}, max_retries: 4)
    end
    assert_equal(5, requester.attempts.length)
  end

  def test_client_retry_after_seconds
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after" => "1.3", "x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"})
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["X-Stainless-Mock-Slept"], 1.3)
  end

  def test_client_retry_after_date
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after" => (Time.now + 2).httpdate, "x-stainless-mock-sleep" => "true", "x-stainless-mock-sleep-base" => (Time.now).httpdate})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"})
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["X-Stainless-Mock-Slept"], 2)
  end

  def test_client_retry_after_ms
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key", max_retries: 1)
    requester = MockRequester.new(500, {}, {"retry-after-ms" => "1300", "x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::InternalServerError) do
      braintrust.projects.create({name: "name"})
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["X-Stainless-Mock-Slept"], 1.3)
  end

  def test_client_redirect_307
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::APIConnectionError) do
      braintrust.projects.create({name: "name"}, extra_headers: {})
    end
    assert_equal(requester.attempts[1][:path], "/redirected")
    assert_equal(requester.attempts[1][:method], requester.attempts[0][:method])
    assert_equal(requester.attempts[1][:body], requester.attempts[0][:body])
    assert_equal(requester.attempts[1][:headers]["Content-Type"], requester.attempts[0][:headers]["Content-Type"])
  end

  def test_client_redirect_303
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(303, {}, {"location" => "/redirected"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::APIConnectionError) do
      braintrust.projects.create({name: "name"}, extra_headers: {})
    end
    assert_equal(requester.attempts[1][:path], "/redirected")
    assert_equal(requester.attempts[1][:method], :get)
    assert_equal(requester.attempts[1][:body], nil)
    assert_equal(requester.attempts[1][:headers]["Content-Type"], nil)
  end

  def test_client_redirect_auth_keep_same_origin
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::APIConnectionError) do
      braintrust.projects.create({name: "name"}, extra_headers: {"Authorization" => "Bearer xyz"})
    end
    assert_equal(requester.attempts[1][:headers]["Authorization"], requester.attempts[0][:headers]["Authorization"])
  end

  def test_client_redirect_auth_strip_cross_origin
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(307, {}, {"location" => "https://example.com/redirected"})
    braintrust.requester = requester
    assert_raise(Braintrust::HTTP::APIConnectionError) do
      braintrust.projects.create({name: "name"}, extra_headers: {"Authorization" => "Bearer xyz"})
    end
    assert_equal(requester.attempts[1][:headers]["Authorization"], nil)
  end

  def test_default_headers
    braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
    requester = MockRequester.new(200, {}, {"x-stainless-mock-sleep" => "true"})
    braintrust.requester = requester
    braintrust.projects.create({name: "name"})
    headers = requester.attempts[0][:headers]
    assert_not_empty(headers["X-Stainless-Lang"])
    assert_not_empty(headers["X-Stainless-Package-Version"])
    assert_not_empty(headers["X-Stainless-Runtime"])
    assert_not_empty(headers["X-Stainless-Runtime-Version"])
  end
end
