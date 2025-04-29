# typed: strong

module Braintrust
  module Models
    class SpanIframeReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Name of the span iframe
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the span iframe belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # URL to embed the project viewer in an iframe
      sig { returns(String) }
      attr_accessor :url

      # Textual description of the span iframe
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Whether to post messages to the iframe containing the span's data. This is
      # useful when you want to render more data than fits in the URL.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :post_message

      sig do
        params(
          name: String,
          project_id: String,
          url: String,
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Name of the span iframe
        name:,
        # Unique identifier for the project that the span iframe belongs under
        project_id:,
        # URL to embed the project viewer in an iframe
        url:,
        # Textual description of the span iframe
        description: nil,
        # Whether to post messages to the iframe containing the span's data. This is
        # useful when you want to render more data than fits in the URL.
        post_message: nil,
        request_options: {}
      ); end
      sig do
        override
          .returns(
            {
              name: String,
              project_id: String,
              url: String,
              description: T.nilable(String),
              post_message: T.nilable(T::Boolean),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
