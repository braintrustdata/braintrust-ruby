# frozen_string_literal: true

module Braintrust
  module Resources
    class Views
      # Create a new view. If there is an existing view with the same name as the one
      #   specified in the request, will return the existing view unmodified
      #
      # @overload create(name:, object_id_:, object_type:, view_type:, deleted_at: nil, options: nil, user_id: nil, view_data: nil, request_options: {})
      #
      # @param name [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param view_type [Symbol, Braintrust::Models::ViewCreateParams::ViewType, nil]
      # @param deleted_at [Time, nil]
      # @param options [Braintrust::Models::ViewOptions, nil]
      # @param user_id [String, nil]
      # @param view_data [Braintrust::Models::ViewData, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::View]
      #
      # @see Braintrust::Models::ViewCreateParams
      def create(params)
        parsed, options = Braintrust::Models::ViewCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/view",
          body: parsed.transform_keys(object_id_: :object_id),
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Get a view object by its id
      #
      # @overload retrieve(view_id, object_id_:, object_type:, request_options: {})
      #
      # @param view_id [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::View]
      #
      # @see Braintrust::Models::ViewRetrieveParams
      def retrieve(view_id, params)
        parsed, options = Braintrust::Models::ViewRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/view/%1$s", view_id],
          query: parsed.transform_keys(object_id_: :object_id),
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Partially update a view object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @overload update(view_id, object_id_:, object_type:, name: nil, options: nil, user_id: nil, view_data: nil, view_type: nil, request_options: {})
      #
      # @param view_id [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param name [String, nil]
      # @param options [Braintrust::Models::ViewOptions, nil]
      # @param user_id [String, nil]
      # @param view_data [Braintrust::Models::ViewData, nil]
      # @param view_type [Symbol, Braintrust::Models::ViewUpdateParams::ViewType, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::View]
      #
      # @see Braintrust::Models::ViewUpdateParams
      def update(view_id, params)
        parsed, options = Braintrust::Models::ViewUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/view/%1$s", view_id],
          body: parsed.transform_keys(object_id_: :object_id),
          model: Braintrust::Models::View,
          options: options
        )
      end

      # List out all views. The views are sorted by creation date, with the most
      #   recently-created views coming first
      #
      # @overload list(object_id_:, object_type:, ending_before: nil, ids: nil, limit: nil, starting_after: nil, view_name: nil, view_type: nil, request_options: {})
      #
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param starting_after [String]
      # @param view_name [String]
      # @param view_type [Symbol, Braintrust::Models::ViewType, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::View>]
      #
      # @see Braintrust::Models::ViewListParams
      def list(params)
        parsed, options = Braintrust::Models::ViewListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/view",
          query: parsed.transform_keys(object_id_: :object_id),
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Delete a view object by its id
      #
      # @overload delete(view_id, object_id_:, object_type:, request_options: {})
      #
      # @param view_id [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::View]
      #
      # @see Braintrust::Models::ViewDeleteParams
      def delete(view_id, params)
        parsed, options = Braintrust::Models::ViewDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v1/view/%1$s", view_id],
          body: parsed.transform_keys(object_id_: :object_id),
          model: Braintrust::Models::View,
          options: options
        )
      end

      # Create or replace view. If there is an existing view with the same name as the
      #   one specified in the request, will replace the existing view with the provided
      #   fields
      #
      # @overload replace(name:, object_id_:, object_type:, view_type:, deleted_at: nil, options: nil, user_id: nil, view_data: nil, request_options: {})
      #
      # @param name [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param view_type [Symbol, Braintrust::Models::ViewReplaceParams::ViewType, nil]
      # @param deleted_at [Time, nil]
      # @param options [Braintrust::Models::ViewOptions, nil]
      # @param user_id [String, nil]
      # @param view_data [Braintrust::Models::ViewData, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::View]
      #
      # @see Braintrust::Models::ViewReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::ViewReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/view",
          body: parsed.transform_keys(object_id_: :object_id),
          model: Braintrust::Models::View,
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
