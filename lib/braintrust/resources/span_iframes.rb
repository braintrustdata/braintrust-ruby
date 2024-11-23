# frozen_string_literal: true

module Braintrust
  module Resources
    class SpanIframes
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new span_iframe. If there is an existing span_iframe with the same name
      #   as the one specified in the request, will return the existing span_iframe
      #   unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the span iframe
      #   @option params [String] :project_id Unique identifier for the project that the span iframe belongs under
      #   @option params [String] :url URL to embed the project viewer in an iframe
      #   @option params [String, nil] :description Textual description of the span iframe
      #   @option params [Boolean, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #     useful when you want to render more data than fits in the URL.
      #
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SpanIFrame]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/span_iframe",
          headers: {"Content-Type" => "application/json"},
          body: params,
          model: Braintrust::Models::SpanIFrame
        }
        @client.request(req, opts)
      end

      # Get a span_iframe object by its id
      #
      # @param span_iframe_id [String] SpanIframe id
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SpanIFrame]
      def retrieve(span_iframe_id, opts = {})
        req = {
          method: :get,
          path: "/v1/span_iframe/#{span_iframe_id}",
          model: Braintrust::Models::SpanIFrame
        }
        @client.request(req, opts)
      end

      # Partially update a span_iframe object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param span_iframe_id [String] SpanIframe id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :name Name of the span iframe
      #   @option params [Boolean, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #     useful when you want to render more data than fits in the URL.
      #   @option params [String, nil] :url URL to embed the project viewer in an iframe
      #
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SpanIFrame]
      def update(span_iframe_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/span_iframe/#{span_iframe_id}",
          headers: {"Content-Type" => "application/json"},
          body: params,
          model: Braintrust::Models::SpanIFrame
        }
        @client.request(req, opts)
      end

      # List out all span_iframes. The span_iframes are sorted by creation date, with
      #   the most recently-created span_iframes coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :span_iframe_name Name of the span_iframe to search for
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::SpanIFrame>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/span_iframe",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::SpanIFrame
        }
        @client.request(req, opts)
      end

      # Delete a span_iframe object by its id
      #
      # @param span_iframe_id [String] SpanIframe id
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SpanIFrame]
      def delete(span_iframe_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/span_iframe/#{span_iframe_id}",
          model: Braintrust::Models::SpanIFrame
        }
        @client.request(req, opts)
      end

      # Create or replace span_iframe. If there is an existing span_iframe with the same
      #   name as the one specified in the request, will replace the existing span_iframe
      #   with the provided fields
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the span iframe
      #   @option params [String] :project_id Unique identifier for the project that the span iframe belongs under
      #   @option params [String] :url URL to embed the project viewer in an iframe
      #   @option params [String, nil] :description Textual description of the span iframe
      #   @option params [Boolean, nil] :post_message Whether to post messages to the iframe containing the span's data. This is
      #     useful when you want to render more data than fits in the URL.
      #
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SpanIFrame]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/span_iframe",
          headers: {"Content-Type" => "application/json"},
          body: params,
          model: Braintrust::Models::SpanIFrame
        }
        @client.request(req, opts)
      end
    end
  end
end
