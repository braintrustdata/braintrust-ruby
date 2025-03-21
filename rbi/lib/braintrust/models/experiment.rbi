# typed: strong

module Braintrust
  module Models
    class Experiment < Braintrust::BaseModel
      # Unique identifier for the experiment
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the experiment. Within a project, experiment names are unique
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the experiment belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Whether or not the experiment is public. Public experiments can be viewed by
      #   anybody inside or outside the organization
      sig { returns(T::Boolean) }
      def public
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def public=(_)
      end

      # Id of default base experiment to compare against when viewing this experiment
      sig { returns(T.nilable(String)) }
      def base_exp_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_exp_id=(_)
      end

      # Commit, taken directly from `repo_info.commit`
      sig { returns(T.nilable(String)) }
      def commit
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def commit=(_)
      end

      # Date of experiment creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
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

      # Date of experiment deletion, or null if the experiment is still active
      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
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

      # Identifies the user who created the experiment
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

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
          repo_info: T.nilable(Braintrust::Models::RepoInfo),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        project_id:,
        public:,
        base_exp_id: nil,
        commit: nil,
        created: nil,
        dataset_id: nil,
        dataset_version: nil,
        deleted_at: nil,
        description: nil,
        metadata: nil,
        repo_info: nil,
        user_id: nil
      )
      end

      sig do
        override
          .returns(
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
              repo_info: T.nilable(Braintrust::Models::RepoInfo),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
