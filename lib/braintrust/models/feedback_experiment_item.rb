# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackExperimentItem < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   The id of the experiment event to log feedback for. This is the row `id`
      #     returned by `POST /v1/experiment/{experiment_id}/insert`
      #
      #   @return [String]
      required :id, String

      # @!attribute comment
      #   An optional comment string to log about the experiment event
      #
      #   @return [String, nil]
      optional :comment, String, nil?: true

      # @!attribute [r] expected
      #   The ground truth value (an arbitrary, JSON serializable object) that you'd
      #     compare to `output` to determine if your `output` value is correct or not
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :expected

      # @!attribute metadata
      #   A dictionary with additional data about the feedback. If you have a `user_id`,
      #     you can log it here and access it in the Braintrust UI. Note, this metadata does
      #     not correspond to the main event itself, but rather the audit log attached to
      #     the event.
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute scores
      #   A dictionary of numeric values (between 0 and 1) to log. These scores will be
      #     merged into the existing scores for the experiment event
      #
      #   @return [Hash{Symbol=>Float, nil}, nil]
      optional :scores, Braintrust::Internal::Type::HashOf[Float, nil?: true], nil?: true

      # @!attribute source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #
      #   @return [Symbol, Braintrust::Models::FeedbackExperimentItem::Source, nil]
      optional :source, enum: -> { Braintrust::Models::FeedbackExperimentItem::Source }, nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param comment [String, nil]
      #   # @param expected [Object]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param scores [Hash{Symbol=>Float, nil}, nil]
      #   # @param source [Symbol, Braintrust::Models::FeedbackExperimentItem::Source, nil]
      #   # @param tags [Array<String>, nil]
      #   #
      #   def initialize(id:, comment: nil, expected: nil, metadata: nil, scores: nil, source: nil, tags: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      #
      # @see Braintrust::Models::FeedbackExperimentItem#source
      module Source
        extend Braintrust::Internal::Type::Enum

        APP = :app
        API = :api
        EXTERNAL = :external

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
