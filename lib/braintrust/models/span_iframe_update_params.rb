# frozen_string_literal: true

module Braintrust
  module Models
    class SpanIframeUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      #     useful when you want to render more data than fits in the URL.
      #
      #   @return [Boolean, nil]
      optional :post_message, Braintrust::BooleanModel, nil?: true

      # @!attribute url
      #   URL to embed the project viewer in an iframe
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!parse
      #   # @param description [String, nil]
      #   # @param name [String, nil]
      #   # @param post_message [Boolean, nil]
      #   # @param url [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(description: nil, name: nil, post_message: nil, url: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
