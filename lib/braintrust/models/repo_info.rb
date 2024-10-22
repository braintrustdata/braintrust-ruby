# frozen_string_literal: true

module Braintrust
  module Models
    class RepoInfo < BaseModel
      # @!attribute [rw] author_email
      #   Email of the author of the most recent commit
      #   @return [String]
      optional :author_email, String

      # @!attribute [rw] author_name
      #   Name of the author of the most recent commit
      #   @return [String]
      optional :author_name, String

      # @!attribute [rw] branch
      #   Name of the branch the most recent commit belongs to
      #   @return [String]
      optional :branch, String

      # @!attribute [rw] commit
      #   SHA of most recent commit
      #   @return [String]
      optional :commit, String

      # @!attribute [rw] commit_message
      #   Most recent commit message
      #   @return [String]
      optional :commit_message, String

      # @!attribute [rw] commit_time
      #   Time of the most recent commit
      #   @return [String]
      optional :commit_time, String

      # @!attribute [rw] dirty
      #   Whether or not the repo had uncommitted changes when snapshotted
      #   @return [Boolean]
      optional :dirty, Braintrust::BooleanModel

      # @!attribute [rw] git_diff
      #   If the repo was dirty when run, this includes the diff between the current state of the repo and the most recent commit.
      #   @return [String]
      optional :git_diff, String

      # @!attribute [rw] tag
      #   Name of the tag on the most recent commit
      #   @return [String]
      optional :tag, String

      # @!parse
      #   # Create a new instance of RepoInfo from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String, nil] :author_email Email of the author of the most recent commit
      #   #   @option data [String, nil] :author_name Name of the author of the most recent commit
      #   #   @option data [String, nil] :branch Name of the branch the most recent commit belongs to
      #   #   @option data [String, nil] :commit SHA of most recent commit
      #   #   @option data [String, nil] :commit_message Most recent commit message
      #   #   @option data [String, nil] :commit_time Time of the most recent commit
      #   #   @option data [Hash, nil] :dirty Whether or not the repo had uncommitted changes when snapshotted
      #   #   @option data [String, nil] :git_diff If the repo was dirty when run, this includes the diff between the current state
      #   #     of the repo and the most recent commit.
      #   #   @option data [String, nil] :tag Name of the tag on the most recent commit
      #   def initialize(data = {}) = super
    end
  end
end
