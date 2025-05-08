# frozen_string_literal: true

module Braintrust
  module Resources
    class SpanIframes
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::SpanIframeCreateParams} for more details.
      #
      # Create a new span_iframe. If there is an existing span_iframe with the same name
      # as the one specified in the request, will return the existing span_iframe
      # unmodified
      #
      # @overload create(name:, project_id:, url:, description: nil, post_message: nil, request_options: {})
      #
      # @param name [String] Name of the span iframe
      #
      # @param project_id [String] Unique identifier for the project that the span iframe belongs under
      #
      # @param url [String] URL to embed the project viewer in an iframe
      #
      # @param description [String, nil] Textual description of the span iframe
      #
      # @param post_message [Boolean, nil] Whether to post messages to the iframe containing the span's data. This is usefu
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::SpanIFrame]
      #
      # @see Braintrust::Models::SpanIframeCreateParams
      def create(params)
        parsed, options = Braintrust::SpanIframeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/span_iframe",
          body: parsed,
          model: Braintrust::SpanIFrame,
          options: options
        )
      end

      # Get a span_iframe object by its id
      #
      # @overload retrieve(span_iframe_id, request_options: {})
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::SpanIFrame]
      #
      # @see Braintrust::Models::SpanIframeRetrieveParams
      def retrieve(span_iframe_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/span_iframe/%1$s", span_iframe_id],
          model: Braintrust::SpanIFrame,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::SpanIframeUpdateParams} for more details.
      #
      # Partially update a span_iframe object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      #
      # @overload update(span_iframe_id, description: nil, name: nil, post_message: nil, url: nil, request_options: {})
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param description [String, nil] Textual description of the span iframe
      #
      # @param name [String, nil] Name of the span iframe
      #
      # @param post_message [Boolean, nil] Whether to post messages to the iframe containing the span's data. This is usefu
      #
      # @param url [String, nil] URL to embed the project viewer in an iframe
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::SpanIFrame]
      #
      # @see Braintrust::Models::SpanIframeUpdateParams
      def update(span_iframe_id, params = {})
        parsed, options = Braintrust::SpanIframeUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/span_iframe/%1$s", span_iframe_id],
          body: parsed,
          model: Braintrust::SpanIFrame,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::SpanIframeListParams} for more details.
      #
      # List out all span_iframes. The span_iframes are sorted by creation date, with
      # the most recently-created span_iframes coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, span_iframe_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param span_iframe_name [String] Name of the span_iframe to search for
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::SpanIFrame>]
      #
      # @see Braintrust::Models::SpanIframeListParams
      def list(params = {})
        parsed, options = Braintrust::SpanIframeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/span_iframe",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::SpanIFrame,
          options: options
        )
      end

      # Delete a span_iframe object by its id
      #
      # @overload delete(span_iframe_id, request_options: {})
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::SpanIFrame]
      #
      # @see Braintrust::Models::SpanIframeDeleteParams
      def delete(span_iframe_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/span_iframe/%1$s", span_iframe_id],
          model: Braintrust::SpanIFrame,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::SpanIframeReplaceParams} for more details.
      #
      # Create or replace span_iframe. If there is an existing span_iframe with the same
      # name as the one specified in the request, will replace the existing span_iframe
      # with the provided fields
      #
      # @overload replace(name:, project_id:, url:, description: nil, post_message: nil, request_options: {})
      #
      # @param name [String] Name of the span iframe
      #
      # @param project_id [String] Unique identifier for the project that the span iframe belongs under
      #
      # @param url [String] URL to embed the project viewer in an iframe
      #
      # @param description [String, nil] Textual description of the span iframe
      #
      # @param post_message [Boolean, nil] Whether to post messages to the iframe containing the span's data. This is usefu
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::SpanIFrame]
      #
      # @see Braintrust::Models::SpanIframeReplaceParams
      def replace(params)
        parsed, options = Braintrust::SpanIframeReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/span_iframe",
          body: parsed,
          model: Braintrust::SpanIFrame,
          options: options
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
