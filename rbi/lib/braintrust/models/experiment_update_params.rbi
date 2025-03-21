# typed: strong

module Braintrust
  module Models
    class ExperimentUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash)))
      end
      def repo_info=(_)
      end

      sig do
        params(
          base_exp_id: T.nilable(String),
          dataset_id: T.nilable(String),
          dataset_version: T.nilable(String),
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          public: T.nilable(T::Boolean),
          repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash)),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        base_exp_id: nil,
        dataset_id: nil,
        dataset_version: nil,
        description: nil,
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
              base_exp_id: T.nilable(String),
              dataset_id: T.nilable(String),
              dataset_version: T.nilable(String),
              description: T.nilable(String),
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
