# typed: strong

module Braintrust
  module Models
    class SpanIframeUpdateParams < Braintrust::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Textual description of the span iframe
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the span iframe
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Whether to post messages to the iframe containing the span's data. This is
      #   useful when you want to render more data than fits in the URL.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :post_message

      # URL to embed the project viewer in an iframe
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      sig do
        params(
          description: T.nilable(String),
          name: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          url: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(description: nil, name: nil, post_message: nil, url: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              description: T.nilable(String),
              name: T.nilable(String),
              post_message: T.nilable(T::Boolean),
              url: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
