# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackProjectLogsItem < Braintrust::BaseModel
      # @!attribute id
      #   The id of the project logs event to log feedback for. This is the row `id`
      #     returned by `POST /v1/project_logs/{project_id}/insert`
      #
      #   @return [String]
      required :id, String

      # @!attribute comment
      #   An optional comment string to log about the project logs event
      #
      #   @return [String, nil]
      optional :comment, String, nil?: true

      # @!attribute [r] expected
      #   The ground truth value (an arbitrary, JSON serializable object) that you'd
      #     compare to `output` to determine if your `output` value is correct or not
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Unknown

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
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute scores
      #   A dictionary of numeric values (between 0 and 1) to log. These scores will be
      #     merged into the existing scores for the project logs event
      #
      #   @return [Hash{Symbol=>Float, nil}, nil]
      optional :scores, Braintrust::HashOf[Float, nil?: true], nil?: true

      # @!attribute source
      #   The source of the feedback. Must be one of "external" (default), "app", or "api"
      #
      #   @return [Symbol, Braintrust::Models::FeedbackProjectLogsItem::Source, nil]
      optional :source, enum: -> { Braintrust::Models::FeedbackProjectLogsItem::Source }, nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::ArrayOf[String], nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param comment [String, nil]
      #   # @param expected [Object]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param scores [Hash{Symbol=>Float, nil}, nil]
      #   # @param source [Symbol, Braintrust::Models::FeedbackProjectLogsItem::Source, nil]
      #   # @param tags [Array<String>, nil]
      #   #
      #   def initialize(id:, comment: nil, expected: nil, metadata: nil, scores: nil, source: nil, tags: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      #
      # @example
      # ```ruby
      # case source
      # in :app
      #   # ...
      # in :api
      #   # ...
      # in :external
      #   # ...
      # end
      # ```
      class Source < Braintrust::Enum
        APP = :app
        API = :api
        EXTERNAL = :external

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
