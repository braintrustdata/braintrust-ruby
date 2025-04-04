# frozen_string_literal: true

module Braintrust
  module Models
    class RepoInfo < Braintrust::Internal::Type::BaseModel
      # @!attribute author_email
      #   Email of the author of the most recent commit
      #
      #   @return [String, nil]
      optional :author_email, String, nil?: true

      # @!attribute author_name
      #   Name of the author of the most recent commit
      #
      #   @return [String, nil]
      optional :author_name, String, nil?: true

      # @!attribute branch
      #   Name of the branch the most recent commit belongs to
      #
      #   @return [String, nil]
      optional :branch, String, nil?: true

      # @!attribute commit
      #   SHA of most recent commit
      #
      #   @return [String, nil]
      optional :commit, String, nil?: true

      # @!attribute commit_message
      #   Most recent commit message
      #
      #   @return [String, nil]
      optional :commit_message, String, nil?: true

      # @!attribute commit_time
      #   Time of the most recent commit
      #
      #   @return [String, nil]
      optional :commit_time, String, nil?: true

      # @!attribute dirty
      #   Whether or not the repo had uncommitted changes when snapshotted
      #
      #   @return [Boolean, nil]
      optional :dirty, Braintrust::Internal::Type::BooleanModel, nil?: true

      # @!attribute git_diff
      #   If the repo was dirty when run, this includes the diff between the current state
      #     of the repo and the most recent commit.
      #
      #   @return [String, nil]
      optional :git_diff, String, nil?: true

      # @!attribute tag
      #   Name of the tag on the most recent commit
      #
      #   @return [String, nil]
      optional :tag, String, nil?: true

      # @!parse
      #   # Metadata about the state of the repo when the experiment was created
      #   #
      #   # @param author_email [String, nil]
      #   # @param author_name [String, nil]
      #   # @param branch [String, nil]
      #   # @param commit [String, nil]
      #   # @param commit_message [String, nil]
      #   # @param commit_time [String, nil]
      #   # @param dirty [Boolean, nil]
      #   # @param git_diff [String, nil]
      #   # @param tag [String, nil]
      #   #
      #   def initialize(
      #     author_email: nil,
      #     author_name: nil,
      #     branch: nil,
      #     commit: nil,
      #     commit_message: nil,
      #     commit_time: nil,
      #     dirty: nil,
      #     git_diff: nil,
      #     tag: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
