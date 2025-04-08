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

      # @!parse
      #   # @param id [String]
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param url [String]
      #   # @param created [Time, nil]
      #   # @param deleted_at [Time, nil]
      #   # @param description [String, nil]
      #   # @param post_message [Boolean, nil]
      #   # @param user_id [String, nil]
      #   #
      #   def initialize(
      #     id:,
      #     name:,
      #     project_id:,
      #     url:,
      #     created: nil,
      #     deleted_at: nil,
      #     description: nil,
      #     post_message: nil,
      #     user_id: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
