# frozen_string_literal: true

module Braintrust
  module Resources
    class SpanIframes
      # Create a new span_iframe. If there is an existing span_iframe with the same name
      #   as the one specified in the request, will return the existing span_iframe
      #   unmodified
      #
      # @param params [Braintrust::Models::SpanIframeCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the span iframe
      #
      #   @option params [String] :project_id Unique identifier for the project that the span iframe belongs under
      #
      #   @option params [String] :url URL to embed the project viewer in an iframe
      #
      #   @option params [String, nil] :description Textual description of the span iframe
      #
      #   @option params [Boolean, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #     useful when you want to render more data than fits in the URL.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SpanIFrame]
      #
      def create(params)
        parsed, options = Braintrust::Models::SpanIframeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/span_iframe",
          body: parsed,
          model: Braintrust::Models::SpanIFrame,
          options: options
        )
      end

      # Get a span_iframe object by its id
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param params [Braintrust::Models::SpanIframeRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SpanIFrame]
      #
      def retrieve(span_iframe_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/span_iframe/%0s", span_iframe_id],
          model: Braintrust::Models::SpanIFrame,
          options: params[:request_options]
        )
      end

      # Partially update a span_iframe object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param params [Braintrust::Models::SpanIframeUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :description Textual description of the span iframe
      #
      #   @option params [String, nil] :name Name of the span iframe
      #
      #   @option params [Boolean, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #     useful when you want to render more data than fits in the URL.
      #
      #   @option params [String, nil] :url URL to embed the project viewer in an iframe
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SpanIFrame]
      #
      def update(span_iframe_id, params = {})
        parsed, options = Braintrust::Models::SpanIframeUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/span_iframe/%0s", span_iframe_id],
          body: parsed,
          model: Braintrust::Models::SpanIFrame,
          options: options
        )
      end

      # List out all span_iframes. The span_iframes are sorted by creation date, with
      #   the most recently-created span_iframes coming first
      #
      # @param params [Braintrust::Models::SpanIframeListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :org_name Filter search results to within a particular organization
      #
      #   @option params [String] :span_iframe_name Name of the span_iframe to search for
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::SpanIFrame>]
      #
      def list(params = {})
        parsed, options = Braintrust::Models::SpanIframeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/span_iframe",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::SpanIFrame,
          options: options
        )
      end

      # Delete a span_iframe object by its id
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param params [Braintrust::Models::SpanIframeDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SpanIFrame]
      #
      def delete(span_iframe_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/span_iframe/%0s", span_iframe_id],
          model: Braintrust::Models::SpanIFrame,
          options: params[:request_options]
        )
      end

      # Create or replace span_iframe. If there is an existing span_iframe with the same
      #   name as the one specified in the request, will replace the existing span_iframe
      #   with the provided fields
      #
      # @param params [Braintrust::Models::SpanIframeReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the span iframe
      #
      #   @option params [String] :project_id Unique identifier for the project that the span iframe belongs under
      #
      #   @option params [String] :url URL to embed the project viewer in an iframe
      #
      #   @option params [String, nil] :description Textual description of the span iframe
      #
      #   @option params [Boolean, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #     useful when you want to render more data than fits in the URL.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SpanIFrame]
      #
      def replace(params)
        parsed, options = Braintrust::Models::SpanIframeReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/span_iframe",
          body: parsed,
          model: Braintrust::Models::SpanIFrame,
          options: options
        )
      end

      # @param client [Braintrust::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
