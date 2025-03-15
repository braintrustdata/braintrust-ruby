# typed: strong

module Braintrust
  module Models
    class RepoInfo < Braintrust::BaseModel
      # Email of the author of the most recent commit
      sig { returns(T.nilable(String)) }
      def author_email
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def author_email=(_)
      end

      # Name of the author of the most recent commit
      sig { returns(T.nilable(String)) }
      def author_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def author_name=(_)
      end

      # Name of the branch the most recent commit belongs to
      sig { returns(T.nilable(String)) }
      def branch
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def branch=(_)
      end

      # SHA of most recent commit
      sig { returns(T.nilable(String)) }
      def commit
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def commit=(_)
      end

      # Most recent commit message
      sig { returns(T.nilable(String)) }
      def commit_message
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def commit_message=(_)
      end

      # Time of the most recent commit
      sig { returns(T.nilable(String)) }
      def commit_time
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def commit_time=(_)
      end

      # Whether or not the repo had uncommitted changes when snapshotted
      sig { returns(T.nilable(T::Boolean)) }
      def dirty
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def dirty=(_)
      end

      # If the repo was dirty when run, this includes the diff between the current state
      #   of the repo and the most recent commit.
      sig { returns(T.nilable(String)) }
      def git_diff
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def git_diff=(_)
      end

      # Name of the tag on the most recent commit
      sig { returns(T.nilable(String)) }
      def tag
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def tag=(_)
      end

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
        )
          .returns(T.attached_class)
      end
      def self.new(
        author_email: nil,
        author_name: nil,
        branch: nil,
        commit: nil,
        commit_message: nil,
        commit_time: nil,
        dirty: nil,
        git_diff: nil,
        tag: nil
      )
      end

      sig do
        override
          .returns(
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
