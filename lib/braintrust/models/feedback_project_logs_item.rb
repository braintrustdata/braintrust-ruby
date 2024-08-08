# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackProjectLogsItem < BaseModel
      # @!attribute [rw] id
      #   The id of the project logs event to log feedback for. This is the row `id` returned by `POST /v1/project_logs/{project_id}/insert`
      #   @return [String]
      required :id, String

      # @!attribute [rw] comment
      #   An optional comment string to log about the project logs event
      #   @return [String]
      optional :comment, String

      # @!attribute [rw] expected
      #   The ground truth value (an arbitrary, JSON serializable object) that you'd compare to `output` to determine if your `output` value is correct or not
      #   @return [Object]
      optional :expected, Braintrust::Unknown

      # @!attribute [rw] metadata
      #   A dictionary with additional data about the feedback. If you have a `user_id`, you can log it here and access it in the Braintrust UI.
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] scores
      #   A dictionary of numeric values (between 0 and 1) to log. These scores will be merged into the existing scores for the project logs event
      #   @return [Hash]
      optional :scores, Hash

      # @!attribute [rw] source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #   @return [Symbol]
      optional :source, Braintrust::Enum.new(:app, :api, :external)
    end
  end
end
