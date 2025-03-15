# typed: strong

module Braintrust
  module Models
    class ExperimentCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Unique identifier for the project that the experiment belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Id of default base experiment to compare against when viewing this experiment
      sig { returns(T.nilable(String)) }
      def base_exp_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_exp_id=(_)
      end

      # Identifier of the linked dataset, or null if the experiment is not linked to a
      #   dataset
      sig { returns(T.nilable(String)) }
      def dataset_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def dataset_id=(_)
      end

      # Version number of the linked dataset the experiment was run against. This can be
      #   used to reproduce the experiment after the dataset has been modified.
      sig { returns(T.nilable(String)) }
      def dataset_version
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def dataset_version=(_)
      end

      # Textual description of the experiment
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # Normally, creating an experiment with the same name as an existing experiment
      #   will return the existing one un-modified. But if `ensure_new` is true,
      #   registration will generate a new experiment with a unique name in case of a
      #   conflict.
      sig { returns(T.nilable(T::Boolean)) }
      def ensure_new
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def ensure_new=(_)
      end

      # User-controlled metadata about the experiment
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      # Name of the experiment. Within a project, experiment names are unique
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      # Whether or not the experiment is public. Public experiments can be viewed by
      #   anybody inside or outside the organization
      sig { returns(T.nilable(T::Boolean)) }
      def public
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def public=(_)
      end

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info
      end

      sig { params(_: T.nilable(Braintrust::Models::RepoInfo)).returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info=(_)
      end

      sig do
        params(
          project_id: String,
          base_exp_id: T.nilable(String),
          dataset_id: T.nilable(String),
          dataset_version: T.nilable(String),
          description: T.nilable(String),
          ensure_new: T.nilable(T::Boolean),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          public: T.nilable(T::Boolean),
          repo_info: T.nilable(Braintrust::Models::RepoInfo),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        project_id:,
        base_exp_id: nil,
        dataset_id: nil,
        dataset_version: nil,
        description: nil,
        ensure_new: nil,
        metadata: nil,
        name: nil,
        public: nil,
        repo_info: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              project_id: String,
              base_exp_id: T.nilable(String),
              dataset_id: T.nilable(String),
              dataset_version: T.nilable(String),
              description: T.nilable(String),
              ensure_new: T.nilable(T::Boolean),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              name: T.nilable(String),
              public: T.nilable(T::Boolean),
              repo_info: T.nilable(Braintrust::Models::RepoInfo),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
