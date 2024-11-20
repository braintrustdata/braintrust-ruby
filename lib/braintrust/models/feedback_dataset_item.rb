# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackDatasetItem < Braintrust::BaseModel
      # @!attribute [rw] id
      #   The id of the dataset event to log feedback for. This is the row `id` returned by `POST /v1/dataset/{dataset_id}/insert`
      #   @return [String]
      required :id, String

      # @!attribute [rw] comment
      #   An optional comment string to log about the dataset event
      #   @return [String]
      optional :comment, String

      # @!attribute [rw] metadata
      #   A dictionary with additional data about the feedback. If you have a `user_id`, you can log it here and access it in the Braintrust UI. Note, this metadata does not correspond to the main event itself, but rather the audit log attached to the event.
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #   @return [Symbol, Braintrust::Models::FeedbackDatasetItem::Source]
      optional :source, enum: -> { Braintrust::Models::FeedbackDatasetItem::Source }

      # @!attribute [rw] tags
      #   A list of tags to log
      #   @return [Array<String>]
      optional :tags, Braintrust::ArrayOf.new(String)

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      class Source < Braintrust::Enum
        APP = :app
        API = :api
        EXTERNAL = :external
      end

      # @!parse
      #   # Create a new instance of FeedbackDatasetItem from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id The id of the dataset event to log feedback for. This is the row `id` returned
      #   #     by `POST /v1/dataset/{dataset_id}/insert`
      #   #   @option data [String, nil] :comment An optional comment string to log about the dataset event
      #   #   @option data [Hash, nil] :metadata A dictionary with additional data about the feedback. If you have a `user_id`,
      #   #     you can log it here and access it in the Braintrust UI. Note, this metadata does
      #   #     not correspond to the main event itself, but rather the audit log attached to
      #   #     the event.
      #   #   @option data [String, nil] :source The source of the feedback. Must be one of "external" (default), "app", or "api"
      #   #   @option data [Array<String>, nil] :tags A list of tags to log
      #   def initialize(data = {}) = super
    end
  end
end
