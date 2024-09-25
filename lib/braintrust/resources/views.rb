# frozen_string_literal: true

module Braintrust
  module Resources
    class Views
      def initialize(client:)
        @client = client
      end

      # Create a new view. If there is an existing view with the same name as the one
      #   specified in the request, will return the existing view unmodified
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the view
      # @option params [String] :object_id The id of the object the view applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      # @option params [Symbol] :view_type Type of table that the view corresponds to.
      # @option params [DateTime] :deleted_at Date of role deletion, or null if the role is still active
      # @option params [Braintrust::Models::ViewOptions] :options Options for the view in the app
      # @option params [String] :user_id Identifies the user who created the view
      # @option params [Braintrust::Models::ViewData] :view_data The view definition
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/view"
        req[:body] = params
        req[:model] = Braintrust::Models::View
        @client.request(req, opts)
      end

      # Get a view object by its id
      #
      # @param view_id [String] View id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :object_id The id of the object the ACL applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def retrieve(view_id, params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/view/#{view_id}"
        req[:query] = params
        req[:model] = Braintrust::Models::View
        @client.request(req, opts)
      end

      # Partially update a view object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @param view_id [String] View id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :object_id The id of the object the view applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      # @option params [String] :name Name of the view
      # @option params [Braintrust::Models::ViewOptions] :options Options for the view in the app
      # @option params [String] :user_id Identifies the user who created the view
      # @option params [Braintrust::Models::ViewData] :view_data The view definition
      # @option params [Symbol] :view_type Type of table that the view corresponds to.
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def update(view_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/view/#{view_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::View
        @client.request(req, opts)
      end

      # List out all views. The views are sorted by creation date, with the most
      #   recently-created views coming first
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :object_id The id of the object the ACL applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      # @option params [String] :ending_before Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :starting_after Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # @option params [String] :view_name Name of the view to search for
      # @option params [Symbol] :view_type Type of table that the view corresponds to.
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::View>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/view"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::View
        @client.request(req, opts)
      end

      # Delete a view object by its id
      #
      # @param view_id [String] View id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :object_id The id of the object the view applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def delete(view_id, params = {}, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/view/#{view_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::View
        @client.request(req, opts)
      end

      # Create or replace view. If there is an existing view with the same name as the
      #   one specified in the request, will replace the existing view with the provided
      #   fields
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the view
      # @option params [String] :object_id The id of the object the view applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      # @option params [Symbol] :view_type Type of table that the view corresponds to.
      # @option params [DateTime] :deleted_at Date of role deletion, or null if the role is still active
      # @option params [Braintrust::Models::ViewOptions] :options Options for the view in the app
      # @option params [String] :user_id Identifies the user who created the view
      # @option params [Braintrust::Models::ViewData] :view_data The view definition
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/view"
        req[:body] = params
        req[:model] = Braintrust::Models::View
        @client.request(req, opts)
      end
    end
  end
end
