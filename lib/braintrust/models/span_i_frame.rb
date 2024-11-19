# frozen_string_literal: true

module Braintrust
  module Models
    class SpanIFrame < Braintrust::BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the span iframe
      #   @return [String]
      required :id, String

      # @!attribute [rw] name
      #   Name of the span iframe
      #   @return [String]
      required :name, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the span iframe belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] url
      #   URL to embed the project viewer in an iframe
      #   @return [String]
      required :url, String

      # @!attribute [rw] created
      #   Date of span iframe creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] deleted_at
      #   Date of span iframe deletion, or null if the span iframe is still active
      #   @return [Time]
      optional :deleted_at, Time

      # @!attribute [rw] description
      #   Textual description of the span iframe
      #   @return [String]
      optional :description, String

      # @!attribute [rw] post_message
      #   Whether to post messages to the iframe containing the span's data. This is useful when you want to render more data than fits in the URL.
      #   @return [Boolean]
      optional :post_message, Braintrust::BooleanModel

      # @!attribute [rw] user_id
      #   Identifies the user who created the span iframe
      #   @return [String]
      optional :user_id, String

      # @!parse
      #   # Create a new instance of SpanIFrame from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the span iframe
      #   #   @option data [String] :name Name of the span iframe
      #   #   @option data [String] :project_id Unique identifier for the project that the span iframe belongs under
      #   #   @option data [String] :url URL to embed the project viewer in an iframe
      #   #   @option data [String, nil] :created Date of span iframe creation
      #   #   @option data [String, nil] :deleted_at Date of span iframe deletion, or null if the span iframe is still active
      #   #   @option data [String, nil] :description Textual description of the span iframe
      #   #   @option data [Hash, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #   #     useful when you want to render more data than fits in the URL.
      #   #   @option data [String, nil] :user_id Identifies the user who created the span iframe
      #   def initialize(data = {}) = super
    end
  end
end
