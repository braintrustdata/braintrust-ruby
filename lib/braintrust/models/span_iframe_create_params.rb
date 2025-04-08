# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::SpanIframes#create
    class SpanIframeCreateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
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

      # @!parse
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param url [String]
      #   # @param description [String, nil]
      #   # @param post_message [Boolean, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, project_id:, url:, description: nil, post_message: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
