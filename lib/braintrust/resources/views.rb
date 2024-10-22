# frozen_string_literal: true

module Braintrust
  module Resources
    class Views
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new view. If there is an existing view with the same name as the one
      #   specified in the request, will return the existing view unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the view
      #   @option params [String] :object_id The id of the object the view applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [Symbol, ViewType] :view_type Type of table that the view corresponds to.
      #   @option params [Time, nil] :deleted_at Date of role deletion, or null if the role is still active
      #   @option params [Braintrust::Models::ViewOptions, nil] :options Options for the view in the app
      #   @option params [String, nil] :user_id Identifies the user who created the view
      #   @option params [Braintrust::Models::ViewData, nil] :view_data The view definition
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/view",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::View
        }
        @client.request(req, opts)
      end

      # Get a view object by its id
      #
      # @param view_id [String] View id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the ACL applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def retrieve(view_id, params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/view/#{view_id}",
          query: params,
          model: Braintrust::Models::View
        }
        @client.request(req, opts)
      end

      # Partially update a view object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @param view_id [String] View id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the view applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [String, nil] :name Name of the view
      #   @option params [Braintrust::Models::ViewOptions, nil] :options Options for the view in the app
      #   @option params [String, nil] :user_id Identifies the user who created the view
      #   @option params [Braintrust::Models::ViewData, nil] :view_data The view definition
      #   @option params [Symbol, ViewType, nil] :view_type Type of table that the view corresponds to.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def update(view_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/view/#{view_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::View
        }
        @client.request(req, opts)
      end

      # List out all views. The views are sorted by creation date, with the most
      #   recently-created views coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the ACL applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #   @option params [String, nil] :view_name Name of the view to search for
      #   @option params [Symbol, ViewType, nil] :view_type Type of table that the view corresponds to.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::View>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/view",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::View
        }
        @client.request(req, opts)
      end

      # Delete a view object by its id
      #
      # @param view_id [String] View id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the view applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def delete(view_id, params = {}, opts = {})
        req = {
          method: :delete,
          path: "/v1/view/#{view_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::View
        }
        @client.request(req, opts)
      end

      # Create or replace view. If there is an existing view with the same name as the
      #   one specified in the request, will replace the existing view with the provided
      #   fields
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the view
      #   @option params [String] :object_id The id of the object the view applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [Symbol, ViewType] :view_type Type of table that the view corresponds to.
      #   @option params [Time, nil] :deleted_at Date of role deletion, or null if the role is still active
      #   @option params [Braintrust::Models::ViewOptions, nil] :options Options for the view in the app
      #   @option params [String, nil] :user_id Identifies the user who created the view
      #   @option params [Braintrust::Models::ViewData, nil] :view_data The view definition
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::View]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/view",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::View
        }
        @client.request(req, opts)
      end
    end
  end
end
