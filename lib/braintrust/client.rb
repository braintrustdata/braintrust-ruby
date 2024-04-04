# frozen_string_literal: true

module Braintrust
  class Client < Braintrust::BaseClient
        DEFAULT_MAX_RETRIES = 2

        attr_reader(:api_key, :top_level, :project, :experiment, :dataset)

        # @!visibility private
        def auth_headers
            {"Authorization" => "Bearer #{@api_key}"}
        end

        # Creates and returns a new client for interacting with the API.
        def initialize(environment:nil, api_key:nil, base_url:nil, max_retries:nil)
            environments = {production: "https://api.braintrustdata.com", }
            default_headers = {}
            @api_key = [
                  api_key, ENV["BRAINTRUST_API_KEY"]].find {|value| !value.nil?}
            server_uri_string = environments[environment&.to_sym] || base_url
            super(
              server_uri_string: server_uri_string,
              headers: default_headers,
              max_retries: max_retries || DEFAULT_MAX_RETRIES,
              idempotency_header: nil
            )

            @top_level = Braintrust::Resources::TopLevel.new(client: self)
            @project = Braintrust::Resources::Project.new(client: self)
            @experiment = Braintrust::Resources::Experiment.new(client: self)
            @dataset = Braintrust::Resources::Dataset.new(client: self)
        end

        # @!visibility private
        def make_status_error(message:, body:, response:)
            case response.code.to_i
            when 400
              Braintrust::HTTP::BadRequestError.new(message: message, response: response, body: body)
            when 401
              Braintrust::HTTP::AuthenticationError.new(message: message, response: response, body: body)
            when 403
              Braintrust::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
            when 404
              Braintrust::HTTP::NotFoundError.new(message: message, response: response, body: body)
            when 409
              Braintrust::HTTP::ConflictError.new(message: message, response: response, body: body)
            when 422
              Braintrust::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
            when 429
              Braintrust::HTTP::RateLimitError.new(message: message, response: response, body: body)
            when 500..599
              Braintrust::HTTP::InternalServerError.new(message: message, response: response, body: body)
            else
              Braintrust::HTTP::APIStatusError.new(message: message, response: response, body: body)
            end
        end
  end
end
