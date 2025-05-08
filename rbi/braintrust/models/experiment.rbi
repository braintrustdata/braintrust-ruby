# typed: strong

module Braintrust
  module Models
    class Experiment < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Unique identifier for the experiment
      sig { returns(String) }
      attr_accessor :id

      # Name of the experiment. Within a project, experiment names are unique
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the experiment belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Whether or not the experiment is public. Public experiments can be viewed by
      # anybody inside or outside the organization
      sig { returns(T::Boolean) }
      attr_accessor :public

      # Id of default base experiment to compare against when viewing this experiment
      sig { returns(T.nilable(String)) }
      attr_accessor :base_exp_id

      # Commit, taken directly from `repo_info.commit`
      sig { returns(T.nilable(String)) }
      attr_accessor :commit

      # Date of experiment creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Identifier of the linked dataset, or null if the experiment is not linked to a
      # dataset
      sig { returns(T.nilable(String)) }
      attr_accessor :dataset_id

      # Version number of the linked dataset the experiment was run against. This can be
      # used to reproduce the experiment after the dataset has been modified.
      sig { returns(T.nilable(String)) }
      attr_accessor :dataset_version

      # Date of experiment deletion, or null if the experiment is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Textual description of the experiment
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # User-controlled metadata about the experiment
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::RepoInfo)) }
      attr_reader :repo_info

      sig { params(repo_info: T.nilable(Braintrust::RepoInfo::OrHash)).void }
      attr_writer :repo_info

      # Identifies the user who created the experiment
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          public: T::Boolean,
          base_exp_id: T.nilable(String),
          commit: T.nilable(String),
          created: T.nilable(Time),
          dataset_id: T.nilable(String),
          dataset_version: T.nilable(String),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          repo_info: T.nilable(Braintrust::RepoInfo::OrHash),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the experiment
        id:,
        # Name of the experiment. Within a project, experiment names are unique
        name:,
        # Unique identifier for the project that the experiment belongs under
        project_id:,
        # Whether or not the experiment is public. Public experiments can be viewed by
        # anybody inside or outside the organization
        public:,
        # Id of default base experiment to compare against when viewing this experiment
        base_exp_id: nil,
        # Commit, taken directly from `repo_info.commit`
        commit: nil,
        # Date of experiment creation
        created: nil,
        # Identifier of the linked dataset, or null if the experiment is not linked to a
        # dataset
        dataset_id: nil,
        # Version number of the linked dataset the experiment was run against. This can be
        # used to reproduce the experiment after the dataset has been modified.
        dataset_version: nil,
        # Date of experiment deletion, or null if the experiment is still active
        deleted_at: nil,
        # Textual description of the experiment
        description: nil,
        # User-controlled metadata about the experiment
        metadata: nil,
        # Metadata about the state of the repo when the experiment was created
        repo_info: nil,
        # Identifies the user who created the experiment
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            project_id: String,
            public: T::Boolean,
            base_exp_id: T.nilable(String),
            commit: T.nilable(String),
            created: T.nilable(Time),
            dataset_id: T.nilable(String),
            dataset_version: T.nilable(String),
            deleted_at: T.nilable(Time),
            description: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            repo_info: T.nilable(Braintrust::RepoInfo),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
