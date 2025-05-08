# typed: strong

module Braintrust
  module Models
    class RepoInfo < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Email of the author of the most recent commit
      sig { returns(T.nilable(String)) }
      attr_accessor :author_email

      # Name of the author of the most recent commit
      sig { returns(T.nilable(String)) }
      attr_accessor :author_name

      # Name of the branch the most recent commit belongs to
      sig { returns(T.nilable(String)) }
      attr_accessor :branch

      # SHA of most recent commit
      sig { returns(T.nilable(String)) }
      attr_accessor :commit

      # Most recent commit message
      sig { returns(T.nilable(String)) }
      attr_accessor :commit_message

      # Time of the most recent commit
      sig { returns(T.nilable(String)) }
      attr_accessor :commit_time

      # Whether or not the repo had uncommitted changes when snapshotted
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :dirty

      # If the repo was dirty when run, this includes the diff between the current state
      # of the repo and the most recent commit.
      sig { returns(T.nilable(String)) }
      attr_accessor :git_diff

      # Name of the tag on the most recent commit
      sig { returns(T.nilable(String)) }
      attr_accessor :tag

      # Metadata about the state of the repo when the experiment was created
      sig do
        params(
          author_email: T.nilable(String),
          author_name: T.nilable(String),
          branch: T.nilable(String),
          commit: T.nilable(String),
          commit_message: T.nilable(String),
          commit_time: T.nilable(String),
          dirty: T.nilable(T::Boolean),
          git_diff: T.nilable(String),
          tag: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Email of the author of the most recent commit
        author_email: nil,
        # Name of the author of the most recent commit
        author_name: nil,
        # Name of the branch the most recent commit belongs to
        branch: nil,
        # SHA of most recent commit
        commit: nil,
        # Most recent commit message
        commit_message: nil,
        # Time of the most recent commit
        commit_time: nil,
        # Whether or not the repo had uncommitted changes when snapshotted
        dirty: nil,
        # If the repo was dirty when run, this includes the diff between the current state
        # of the repo and the most recent commit.
        git_diff: nil,
        # Name of the tag on the most recent commit
        tag: nil
      )
      end

      sig do
        override.returns(
          {
            author_email: T.nilable(String),
            author_name: T.nilable(String),
            branch: T.nilable(String),
            commit: T.nilable(String),
            commit_message: T.nilable(String),
            commit_time: T.nilable(String),
            dirty: T.nilable(T::Boolean),
            git_diff: T.nilable(String),
            tag: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
