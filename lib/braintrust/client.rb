# frozen_string_literal: true

module Braintrust
  class Client < Braintrust::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String, nil]
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

    # @return [Braintrust::Resources::SpanIframes]
    attr_reader :span_iframes

    # @return [Braintrust::Resources::Functions]
    attr_reader :functions

    # @return [Braintrust::Resources::Views]
    attr_reader :views

    # @return [Braintrust::Resources::Organizations]
    attr_reader :organizations

    # @return [Braintrust::Resources::APIKeys]
    attr_reader :api_keys

    # @return [Braintrust::Resources::AISecrets]
    attr_reader :ai_secrets

    # @return [Braintrust::Resources::EnvVars]
    attr_reader :env_vars

    # @return [Braintrust::Resources::Evals]
    attr_reader :evals

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["BRAINTRUST_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["BRAINTRUST_API_KEY"],
      base_url: nil,
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.braintrust.dev"

      @api_key = api_key&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

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
      @span_iframes = Braintrust::Resources::SpanIframes.new(client: self)
      @functions = Braintrust::Resources::Functions.new(client: self)
      @views = Braintrust::Resources::Views.new(client: self)
      @organizations = Braintrust::Resources::Organizations.new(client: self)
      @api_keys = Braintrust::Resources::APIKeys.new(client: self)
      @ai_secrets = Braintrust::Resources::AISecrets.new(client: self)
      @env_vars = Braintrust::Resources::EnvVars.new(client: self)
      @evals = Braintrust::Resources::Evals.new(client: self)
    end
  end
end
