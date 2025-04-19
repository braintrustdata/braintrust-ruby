# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackDatasetItem < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   The id of the dataset event to log feedback for. This is the row `id` returned
      #   by `POST /v1/dataset/{dataset_id}/insert`
      #
      #   @return [String]
      required :id, String

      # @!attribute comment
      #   An optional comment string to log about the dataset event
      #
      #   @return [String, nil]
      optional :comment, String, nil?: true

      # @!attribute metadata
      #   A dictionary with additional data about the feedback. If you have a `user_id`,
      #   you can log it here and access it in the Braintrust UI. Note, this metadata does
      #   not correspond to the main event itself, but rather the audit log attached to
      #   the event.
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #
      #   @return [Symbol, Braintrust::Models::FeedbackDatasetItem::Source, nil]
      optional :source, enum: -> { Braintrust::Models::FeedbackDatasetItem::Source }, nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(id:, comment: nil, metadata: nil, source: nil, tags: nil)
      #   @param id [String]
      #   @param comment [String, nil]
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   @param source [Symbol, Braintrust::Models::FeedbackDatasetItem::Source, nil]
      #   @param tags [Array<String>, nil]

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      #
      # @see Braintrust::Models::FeedbackDatasetItem#source
      module Source
        extend Braintrust::Internal::Type::Enum

        APP = :app
        API = :api
        EXTERNAL = :external

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
