# typed: strong

module Braintrust
  module Models
    class SpanIframeReplaceParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the span iframe
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the span iframe belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # URL to embed the project viewer in an iframe
      sig { returns(String) }
      def url
      end

      sig { params(_: String).returns(String) }
      def url=(_)
      end

      # Textual description of the span iframe
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # Whether to post messages to the iframe containing the span's data. This is
      #   useful when you want to render more data than fits in the URL.
      sig { returns(T.nilable(T::Boolean)) }
      def post_message
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def post_message=(_)
      end

      sig do
        params(
          name: String,
          project_id: String,
          url: String,
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(name:, project_id:, url:, description: nil, post_message: nil, request_options: {})
      end

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
      def to_hash
      end
    end
  end
end
