# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackDatasetItem < BaseModel
      # @!attribute [rw] id
      #   The id of the dataset event to log feedback for. This is the row `id` returned by `POST /v1/dataset/{dataset_id}/insert`
      #   @return [String]
      required :id, String

      # @!attribute [rw] comment
      #   An optional comment string to log about the dataset event
      #   @return [String]
      optional :comment, String

      # @!attribute [rw] metadata
      #   A dictionary with additional data about the feedback. If you have a `user_id`, you can log it here and access it in the Braintrust UI.
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #   One of the constants defined in {Braintrust::Models::FeedbackDatasetItem::Source}
      #   @return [Symbol]
      optional :source, enum: -> { Braintrust::Models::FeedbackDatasetItem::Source }

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      class Source < Braintrust::Enum
        APP = :app
        API = :api
        EXTERNAL = :external
      end
    end
  end
end
