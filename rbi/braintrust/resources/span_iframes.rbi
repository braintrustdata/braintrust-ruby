# typed: strong

module Braintrust
  module Resources
    class SpanIframes
      # Create a new span_iframe. If there is an existing span_iframe with the same name
      # as the one specified in the request, will return the existing span_iframe
      # unmodified
      sig do
        params(
          name: String,
          project_id: String,
          url: String,
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          request_options: Braintrust::RequestOpts
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def create(
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
      # Get a span_iframe object by its id
      sig do
        params(span_iframe_id: String, request_options: Braintrust::RequestOpts)
          .returns(Braintrust::Models::SpanIFrame)
      end
      def retrieve(
        # SpanIframe id
        span_iframe_id,
        request_options: {}
      ); end
      # Partially update a span_iframe object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      sig do
        params(
          span_iframe_id: String,
          description: T.nilable(String),
          name: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          url: T.nilable(String),
          request_options: Braintrust::RequestOpts
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def update(
        # SpanIframe id
        span_iframe_id,
        # Textual description of the span iframe
        description: nil,
        # Name of the span iframe
        name: nil,
        # Whether to post messages to the iframe containing the span's data. This is
        # useful when you want to render more data than fits in the URL.
        post_message: nil,
        # URL to embed the project viewer in an iframe
        url: nil,
        request_options: {}
      ); end
      # List out all span_iframes. The span_iframes are sorted by creation date, with
      # the most recently-created span_iframes coming first
      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          span_iframe_name: String,
          starting_after: String,
          request_options: Braintrust::RequestOpts
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::SpanIFrame])
      end
      def list(
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Name of the span_iframe to search for
        span_iframe_name: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      ); end
      # Delete a span_iframe object by its id
      sig do
        params(span_iframe_id: String, request_options: Braintrust::RequestOpts)
          .returns(Braintrust::Models::SpanIFrame)
      end
      def delete(
        # SpanIframe id
        span_iframe_id,
        request_options: {}
      ); end
      # Create or replace span_iframe. If there is an existing span_iframe with the same
      # name as the one specified in the request, will replace the existing span_iframe
      # with the provided fields
      sig do
        params(
          name: String,
          project_id: String,
          url: String,
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          request_options: Braintrust::RequestOpts
        )
          .returns(Braintrust::Models::SpanIFrame)
      end
      def replace(
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
      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
