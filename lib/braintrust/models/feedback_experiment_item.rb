# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackExperimentItem < BaseModel
      # @!attribute [rw] id
      #   The id of the experiment event to log feedback for. This is the row `id` returned by `POST /v1/experiment/{experiment_id}/insert`
      #   @return [String]
      required :id, String

      # @!attribute [rw] comment
      #   An optional comment string to log about the experiment event
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
      #   A dictionary of numeric values (between 0 and 1) to log. These scores will be merged into the existing scores for the experiment event
      #   @return [Hash]
      optional :scores, Hash

      # @!attribute [rw] source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #   One of the constants defined in {Braintrust::Models::FeedbackExperimentItem::Source}
      #   @return [Symbol]
      optional :source, enum: -> { Braintrust::Models::FeedbackExperimentItem::Source }

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      class Source < Braintrust::Enum
        APP = :app
        API = :api
        EXTERNAL = :external
      end
    end
  end
end
