# typed: strong

module Braintrust
  module Resources
    class SpanIframes
      sig do
        params(
          name: String,
          project_id: String,
          url: String,
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def create(name:, project_id:, url:, description: nil, post_message: nil, request_options: {})
      end

      sig do
        params(
          span_iframe_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def retrieve(span_iframe_id, request_options: {})
      end

      sig do
        params(
          span_iframe_id: String,
          description: T.nilable(String),
          name: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          url: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def update(
        span_iframe_id,
        description: nil,
        name: nil,
        post_message: nil,
        url: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          span_iframe_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::SpanIFrame])
      end
      def list(
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        span_iframe_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          span_iframe_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def delete(span_iframe_id, request_options: {})
      end

      sig do
        params(
          name: String,
          project_id: String,
          url: String,
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def replace(name:, project_id:, url:, description: nil, post_message: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
