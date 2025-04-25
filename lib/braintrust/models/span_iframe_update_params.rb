# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::SpanIframes#update
    class SpanIframeUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute description
      #   Textual description of the span iframe
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #   Name of the span iframe
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute post_message
      #   Whether to post messages to the iframe containing the span's data. This is
      #   useful when you want to render more data than fits in the URL.
      #
      #   @return [Boolean, nil]
      optional :post_message, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute url
      #   URL to embed the project viewer in an iframe
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(description: nil, name: nil, post_message: nil, url: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::SpanIframeUpdateParams} for more details.
      #
      #   @param description [String, nil] Textual description of the span iframe
      #
      #   @param name [String, nil] Name of the span iframe
      #
      #   @param post_message [Boolean, nil] Whether to post messages to the iframe containing the span's data. This is usefu
      #   ...
      #
      #   @param url [String, nil] URL to embed the project viewer in an iframe
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
