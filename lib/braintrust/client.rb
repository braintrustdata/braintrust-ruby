# frozen_string_literal: true

module Braintrust
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client options.
    attr_reader :api_key

    # @return [Braintrust::Resources::TopLevel]
    attr_reader :top_level

    # @return [Braintrust::Resources::Projects]
    attr_reader :projects

    # @return [Braintrust::Resources::Experiments]
    attr_reader :experiments

    # @return [Braintrust::Resources::Datasets]
    attr_reader :datasets

    # @return [Braintrust::Resources::Prompts]
    attr_reader :prompts

    # @return [Braintrust::Resources::Roles]
    attr_reader :roles

    # @return [Braintrust::Resources::Groups]
    attr_reader :groups

    # @return [Braintrust::Resources::ACLs]
    attr_reader :acls

    # @return [Braintrust::Resources::Users]
    attr_reader :users

    # @return [Braintrust::Resources::ProjectScores]
    attr_reader :project_scores

    # @return [Braintrust::Resources::ProjectTags]
    attr_reader :project_tags

    # @return [Braintrust::Resources::Functions]
    attr_reader :functions

    # @return [Braintrust::Resources::Views]
    attr_reader :views

    # @return [Braintrust::Resources::Organizations]
    attr_reader :organizations

    # @return [Braintrust::Resources::APIKeys]
    attr_reader :api_keys

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

      @top_level = Braintrust::Resources::TopLevel.new(client: self)
      @projects = Braintrust::Resources::Projects.new(client: self)
      @experiments = Braintrust::Resources::Experiments.new(client: self)
      @datasets = Braintrust::Resources::Datasets.new(client: self)
      @prompts = Braintrust::Resources::Prompts.new(client: self)
      @roles = Braintrust::Resources::Roles.new(client: self)
      @groups = Braintrust::Resources::Groups.new(client: self)
      @acls = Braintrust::Resources::ACLs.new(client: self)
      @users = Braintrust::Resources::Users.new(client: self)
      @project_scores = Braintrust::Resources::ProjectScores.new(client: self)
      @project_tags = Braintrust::Resources::ProjectTags.new(client: self)
      @functions = Braintrust::Resources::Functions.new(client: self)
      @views = Braintrust::Resources::Views.new(client: self)
      @organizations = Braintrust::Resources::Organizations.new(client: self)
      @api_keys = Braintrust::Resources::APIKeys.new(client: self)
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
