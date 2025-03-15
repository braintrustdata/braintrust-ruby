# typed: strong

module Braintrust
  class Client < Braintrust::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(T.nilable(String)) }
    def api_key
    end

    sig { returns(Braintrust::Resources::TopLevel) }
    def top_level
    end

    sig { returns(Braintrust::Resources::Projects) }
    def projects
    end

    sig { returns(Braintrust::Resources::Experiments) }
    def experiments
    end

    sig { returns(Braintrust::Resources::Datasets) }
    def datasets
    end

    sig { returns(Braintrust::Resources::Prompts) }
    def prompts
    end

    sig { returns(Braintrust::Resources::Roles) }
    def roles
    end

    sig { returns(Braintrust::Resources::Groups) }
    def groups
    end

    sig { returns(Braintrust::Resources::ACLs) }
    def acls
    end

    sig { returns(Braintrust::Resources::Users) }
    def users
    end

    sig { returns(Braintrust::Resources::ProjectScores) }
    def project_scores
    end

    sig { returns(Braintrust::Resources::ProjectTags) }
    def project_tags
    end

    sig { returns(Braintrust::Resources::SpanIframes) }
    def span_iframes
    end

    sig { returns(Braintrust::Resources::Functions) }
    def functions
    end

    sig { returns(Braintrust::Resources::Views) }
    def views
    end

    sig { returns(Braintrust::Resources::Organizations) }
    def organizations
    end

    sig { returns(Braintrust::Resources::APIKeys) }
    def api_keys
    end

    sig { returns(Braintrust::Resources::AISecrets) }
    def ai_secrets
    end

    sig { returns(Braintrust::Resources::EnvVars) }
    def env_vars
    end

    sig { returns(Braintrust::Resources::Evals) }
    def evals
    end

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        base_url: T.nilable(String),
        api_key: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      )
        .returns(T.attached_class)
    end
    def self.new(
      base_url: nil,
      api_key: ENV["BRAINTRUST_API_KEY"],
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
