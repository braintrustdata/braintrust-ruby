# typed: strong

module Braintrust
  module Resources
    class SpanIframes
      # Create a new span_iframe. If there is an existing span_iframe with the same name
      #   as the one specified in the request, will return the existing span_iframe
      #   unmodified
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

      # Get a span_iframe object by its id
      sig do
        params(
          span_iframe_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def retrieve(span_iframe_id, request_options: {})
      end

      # Partially update a span_iframe object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
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

      # List out all span_iframes. The span_iframes are sorted by creation date, with
      #   the most recently-created span_iframes coming first
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

      # Delete a span_iframe object by its id
      sig do
        params(
          span_iframe_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def delete(span_iframe_id, request_options: {})
      end

      # Create or replace span_iframe. If there is an existing span_iframe with the same
      #   name as the one specified in the request, will replace the existing span_iframe
      #   with the provided fields
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
