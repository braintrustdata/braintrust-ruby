# frozen_string_literal: true

module Braintrust
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client options.
    attr_reader :api_key

    # @return [Braintrust::Resources::TopLevel]
    attr_reader :top_level

    # @return [Braintrust::Resources::Project]
    attr_reader :project

    # @return [Braintrust::Resources::Experiment]
    attr_reader :experiment

    # @return [Braintrust::Resources::Dataset]
    attr_reader :dataset

    # @return [Braintrust::Resources::Prompt]
    attr_reader :prompt

    # @return [Braintrust::Resources::Role]
    attr_reader :role

    # @return [Braintrust::Resources::Group]
    attr_reader :group

    # @return [Braintrust::Resources::ACL]
    attr_reader :acl

    # @return [Braintrust::Resources::User]
    attr_reader :user

    # @return [Braintrust::Resources::ProjectScore]
    attr_reader :project_score

    # @return [Braintrust::Resources::ProjectTag]
    attr_reader :project_tag

    # @return [Braintrust::Resources::Function]
    attr_reader :function

    # @return [Braintrust::Resources::View]
    attr_reader :view

    # @return [Braintrust::Resources::Organization]
    attr_reader :organization

    # @return [Braintrust::Resources::APIKey]
    attr_reader :api_key

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
      @project = Braintrust::Resources::Project.new(client: self)
      @experiment = Braintrust::Resources::Experiment.new(client: self)
      @dataset = Braintrust::Resources::Dataset.new(client: self)
      @prompt = Braintrust::Resources::Prompt.new(client: self)
      @role = Braintrust::Resources::Role.new(client: self)
      @group = Braintrust::Resources::Group.new(client: self)
      @acl = Braintrust::Resources::ACL.new(client: self)
      @user = Braintrust::Resources::User.new(client: self)
      @project_score = Braintrust::Resources::ProjectScore.new(client: self)
      @project_tag = Braintrust::Resources::ProjectTag.new(client: self)
      @function = Braintrust::Resources::Function.new(client: self)
      @view = Braintrust::Resources::View.new(client: self)
      @organization = Braintrust::Resources::Organization.new(client: self)
      @api_key = Braintrust::Resources::APIKey.new(client: self)
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
