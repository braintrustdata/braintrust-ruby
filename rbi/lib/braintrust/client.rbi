# typed: strong

module Braintrust
  class Client < Braintrust::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(T.nilable(String)) }
    attr_reader :api_key

    sig { returns(Braintrust::Resources::TopLevel) }
    attr_reader :top_level

    sig { returns(Braintrust::Resources::Projects) }
    attr_reader :projects

    sig { returns(Braintrust::Resources::Experiments) }
    attr_reader :experiments

    sig { returns(Braintrust::Resources::Datasets) }
    attr_reader :datasets

    sig { returns(Braintrust::Resources::Prompts) }
    attr_reader :prompts

    sig { returns(Braintrust::Resources::Roles) }
    attr_reader :roles

    sig { returns(Braintrust::Resources::Groups) }
    attr_reader :groups

    sig { returns(Braintrust::Resources::ACLs) }
    attr_reader :acls

    sig { returns(Braintrust::Resources::Users) }
    attr_reader :users

    sig { returns(Braintrust::Resources::ProjectScores) }
    attr_reader :project_scores

    sig { returns(Braintrust::Resources::ProjectTags) }
    attr_reader :project_tags

    sig { returns(Braintrust::Resources::SpanIframes) }
    attr_reader :span_iframes

    sig { returns(Braintrust::Resources::Functions) }
    attr_reader :functions

    sig { returns(Braintrust::Resources::Views) }
    attr_reader :views

    sig { returns(Braintrust::Resources::Organizations) }
    attr_reader :organizations

    sig { returns(Braintrust::Resources::APIKeys) }
    attr_reader :api_keys

    sig { returns(Braintrust::Resources::AISecrets) }
    attr_reader :ai_secrets

    sig { returns(Braintrust::Resources::EnvVars) }
    attr_reader :env_vars

    sig { returns(Braintrust::Resources::Evals) }
    attr_reader :evals

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers; end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      )
        .returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["BRAINTRUST_API_KEY"]`
      api_key: ENV["BRAINTRUST_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["BRAINTRUST_BASE_URL"]`
      base_url: ENV["BRAINTRUST_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    ); end
  end
end
