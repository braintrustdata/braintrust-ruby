# frozen_string_literal: true

module Braintrust
  module Models
    class SpanIFrame < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the span iframe
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the span iframe
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the span iframe belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute url
      #   URL to embed the project viewer in an iframe
      #
      #   @return [String]
      required :url, String

      # @!attribute created
      #   Date of span iframe creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute deleted_at
      #   Date of span iframe deletion, or null if the span iframe is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

      # @!attribute description
      #   Textual description of the span iframe
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute post_message
      #   Whether to post messages to the iframe containing the span's data. This is
      #   useful when you want to render more data than fits in the URL.
      #
      #   @return [Boolean, nil]
      optional :post_message, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute user_id
      #   Identifies the user who created the span iframe
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(id:, name:, project_id:, url:, created: nil, deleted_at: nil, description: nil, post_message: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::SpanIFrame} for more details.
      #
      #   @param id [String] Unique identifier for the span iframe
      #
      #   @param name [String] Name of the span iframe
      #
      #   @param project_id [String] Unique identifier for the project that the span iframe belongs under
      #
      #   @param url [String] URL to embed the project viewer in an iframe
      #
      #   @param created [Time, nil] Date of span iframe creation
      #
      #   @param deleted_at [Time, nil] Date of span iframe deletion, or null if the span iframe is still active
      #
      #   @param description [String, nil] Textual description of the span iframe
      #
      #   @param post_message [Boolean, nil] Whether to post messages to the iframe containing the span's data. This is usefu
      #
      #   @param user_id [String, nil] Identifies the user who created the span iframe
    end
  end
end
