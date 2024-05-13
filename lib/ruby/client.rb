# frozen_string_literal: true

module Ruby
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client options.
    attr_reader :api_key

    # @return [Ruby::Resources::TopLevel]
    attr_reader :top_level

    # @return [Ruby::Resources::Project]
    attr_reader :project

    # @return [Ruby::Resources::Experiment]
    attr_reader :experiment

    # @return [Ruby::Resources::Dataset]
    attr_reader :dataset

    # @return [Ruby::Resources::Prompt]
    attr_reader :prompt

    # @return [Ruby::Resources::Role]
    attr_reader :role

    # @return [Ruby::Resources::Group]
    attr_reader :group

    # @return [Ruby::Resources::ACL]
    attr_reader :acl

    # @return [Ruby::Resources::User]
    attr_reader :user

    # @!visibility private
    def auth_headers
      {"Authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    def initialize(base_url: nil, api_key: nil, max_retries: nil)
      base_url ||= "https://api.braintrustdata.com"

      max_retries ||= DEFAULT_MAX_RETRIES

      @api_key = [api_key, ENV["BRAINTRUST_API_KEY"]].find { |v| !v.nil? }
      if @api_key.nil?
        raise ArgumentError, "api_key is required"
      end

      super(base_url: base_url, max_retries: max_retries)

      @top_level = Ruby::Resources::TopLevel.new(client: self)
      @project = Ruby::Resources::Project.new(client: self)
      @experiment = Ruby::Resources::Experiment.new(client: self)
      @dataset = Ruby::Resources::Dataset.new(client: self)
      @prompt = Ruby::Resources::Prompt.new(client: self)
      @role = Ruby::Resources::Role.new(client: self)
      @group = Ruby::Resources::Group.new(client: self)
      @acl = Ruby::Resources::ACL.new(client: self)
      @user = Ruby::Resources::User.new(client: self)
    end

    # @!visibility private
    def make_status_error(message:, body:, response:)
      case response.code.to_i
      when 400
        Ruby::HTTP::BadRequestError.new(message: message, response: response, body: body)
      when 401
        Ruby::HTTP::AuthenticationError.new(message: message, response: response, body: body)
      when 403
        Ruby::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
      when 404
        Ruby::HTTP::NotFoundError.new(message: message, response: response, body: body)
      when 409
        Ruby::HTTP::ConflictError.new(message: message, response: response, body: body)
      when 422
        Ruby::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
      when 429
        Ruby::HTTP::RateLimitError.new(message: message, response: response, body: body)
      when 500..599
        Ruby::HTTP::InternalServerError.new(message: message, response: response, body: body)
      else
        Ruby::HTTP::APIStatusError.new(message: message, response: response, body: body)
      end
    end
  end
end
