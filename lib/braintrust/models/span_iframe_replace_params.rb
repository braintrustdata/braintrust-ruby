# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::SpanIframes#replace
    class SpanIframeReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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

      # @!method initialize(name:, project_id:, url:, description: nil, post_message: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::SpanIframeReplaceParams} for more details.
      #
      #   @param name [String] Name of the span iframe
      #
      #   @param project_id [String] Unique identifier for the project that the span iframe belongs under
      #
      #   @param url [String] URL to embed the project viewer in an iframe
      #
      #   @param description [String, nil] Textual description of the span iframe
      #
      #   @param post_message [Boolean, nil] Whether to post messages to the iframe containing the span's data. This is usefu
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
