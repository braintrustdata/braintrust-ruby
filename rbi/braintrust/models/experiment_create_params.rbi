# typed: strong

module Braintrust
  module Models
    class ExperimentCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::ExperimentCreateParams,
            Braintrust::Internal::AnyHash
          )
        end

      # Unique identifier for the project that the experiment belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Id of default base experiment to compare against when viewing this experiment
      sig { returns(T.nilable(String)) }
      attr_accessor :base_exp_id

      # Identifier of the linked dataset, or null if the experiment is not linked to a
      # dataset
      sig { returns(T.nilable(String)) }
      attr_accessor :dataset_id

      # Version number of the linked dataset the experiment was run against. This can be
      # used to reproduce the experiment after the dataset has been modified.
      sig { returns(T.nilable(String)) }
      attr_accessor :dataset_version

      # Textual description of the experiment
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Normally, creating an experiment with the same name as an existing experiment
      # will return the existing one un-modified. But if `ensure_new` is true,
      # registration will generate a new experiment with a unique name in case of a
      # conflict.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :ensure_new

      # User-controlled metadata about the experiment
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # Name of the experiment. Within a project, experiment names are unique
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Whether or not the experiment is public. Public experiments can be viewed by
      # anybody inside or outside the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :public

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::RepoInfo)) }
      attr_reader :repo_info

      sig { params(repo_info: T.nilable(Braintrust::RepoInfo::OrHash)).void }
      attr_writer :repo_info

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
          repo_info: T.nilable(Braintrust::RepoInfo::OrHash),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the project that the experiment belongs under
        project_id:,
        # Id of default base experiment to compare against when viewing this experiment
        base_exp_id: nil,
        # Identifier of the linked dataset, or null if the experiment is not linked to a
        # dataset
        dataset_id: nil,
        # Version number of the linked dataset the experiment was run against. This can be
        # used to reproduce the experiment after the dataset has been modified.
        dataset_version: nil,
        # Textual description of the experiment
        description: nil,
        # Normally, creating an experiment with the same name as an existing experiment
        # will return the existing one un-modified. But if `ensure_new` is true,
        # registration will generate a new experiment with a unique name in case of a
        # conflict.
        ensure_new: nil,
        # User-controlled metadata about the experiment
        metadata: nil,
        # Name of the experiment. Within a project, experiment names are unique
        name: nil,
        # Whether or not the experiment is public. Public experiments can be viewed by
        # anybody inside or outside the organization
        public: nil,
        # Metadata about the state of the repo when the experiment was created
        repo_info: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
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
            repo_info: T.nilable(Braintrust::RepoInfo),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
