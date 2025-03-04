# frozen_string_literal: true

module Braintrust
  module Resources
    class Views
      # Create a new view. If there is an existing view with the same name as the one
      #   specified in the request, will return the existing view unmodified
      #
      # @param params [Braintrust::Models::ViewCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the view
      #
      #   @option params [String] :object_id_ The id of the object the view applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewCreateParams::ObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewCreateParams::ViewType, nil] :view_type Type of table that the view corresponds to.
      #
      #   @option params [Time, nil] :deleted_at Date of role deletion, or null if the role is still active
      #
      #   @option params [Braintrust::Models::ViewOptions, nil] :options Options for the view in the app
      #
      #   @option params [String, nil] :user_id Identifies the user who created the view
      #
      #   @option params [Braintrust::Models::ViewData, nil] :view_data The view definition
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::View]
      #
      def create(params)
        parsed, options = Braintrust::Models::ViewCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/view",
          body: parsed,
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Get a view object by its id
      #
      # @param view_id [String] View id
      #
      # @param params [Braintrust::Models::ViewRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewRetrieveParams::ObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::View]
      #
      def retrieve(view_id, params)
        parsed, options = Braintrust::Models::ViewRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/view/%0s", view_id],
          query: parsed,
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Partially update a view object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @param view_id [String] View id
      #
      # @param params [Braintrust::Models::ViewUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the view applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewUpdateParams::ObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [String, nil] :name Name of the view
      #
      #   @option params [Braintrust::Models::ViewOptions, nil] :options Options for the view in the app
      #
      #   @option params [String, nil] :user_id Identifies the user who created the view
      #
      #   @option params [Braintrust::Models::ViewData, nil] :view_data The view definition
      #
      #   @option params [Symbol, Braintrust::Models::ViewUpdateParams::ViewType, nil] :view_type Type of table that the view corresponds to.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::View]
      #
      def update(view_id, params)
        parsed, options = Braintrust::Models::ViewUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/view/%0s", view_id],
          body: parsed,
          model: Braintrust::Models::View,
          options: options
        )
      end

      # List out all views. The views are sorted by creation date, with the most
      #   recently-created views coming first
      #
      # @param params [Braintrust::Models::ViewListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewListParams::ObjectType] :object_type The object type that the ACL applies to
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
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [String] :view_name Name of the view to search for
      #
      #   @option params [Symbol, Braintrust::Models::ViewListParams::ViewType, nil] :view_type Type of table that the view corresponds to.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::View>]
      #
      def list(params)
        parsed, options = Braintrust::Models::ViewListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/view",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Delete a view object by its id
      #
      # @param view_id [String] View id
      #
      # @param params [Braintrust::Models::ViewDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the view applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewDeleteParams::ObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::View]
      #
      def delete(view_id, params)
        parsed, options = Braintrust::Models::ViewDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v1/view/%0s", view_id],
          body: parsed,
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Create or replace view. If there is an existing view with the same name as the
      #   one specified in the request, will replace the existing view with the provided
      #   fields
      #
      # @param params [Braintrust::Models::ViewReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the view
      #
      #   @option params [String] :object_id_ The id of the object the view applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewReplaceParams::ObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ViewReplaceParams::ViewType, nil] :view_type Type of table that the view corresponds to.
      #
      #   @option params [Time, nil] :deleted_at Date of role deletion, or null if the role is still active
      #
      #   @option params [Braintrust::Models::ViewOptions, nil] :options Options for the view in the app
      #
      #   @option params [String, nil] :user_id Identifies the user who created the view
      #
      #   @option params [Braintrust::Models::ViewData, nil] :view_data The view definition
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::View]
      #
      def replace(params)
        parsed, options = Braintrust::Models::ViewReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/view",
          body: parsed,
          model: Braintrust::Models::View,
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
