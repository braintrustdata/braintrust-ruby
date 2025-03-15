# typed: strong

module Braintrust
  module Resources
    class Views
      # Create a new view. If there is an existing view with the same name as the one
      #   specified in the request, will return the existing view unmodified
      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Symbol,
          view_type: T.nilable(Symbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(Braintrust::Models::ViewOptions),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::Models::ViewData),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::View)
      end
      def create(
        name:,
        object_id_:,
        object_type:,
        view_type:,
        deleted_at: nil,
        options: nil,
        user_id: nil,
        view_data: nil,
        request_options: {}
      )
      end

      # Get a view object by its id
      sig do
        params(
          view_id: String,
          object_id_: String,
          object_type: Symbol,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::View)
      end
      def retrieve(view_id, object_id_:, object_type:, request_options: {})
      end

      # Partially update a view object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      sig do
        params(
          view_id: String,
          object_id_: String,
          object_type: Symbol,
          name: T.nilable(String),
          options: T.nilable(Braintrust::Models::ViewOptions),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::Models::ViewData),
          view_type: T.nilable(Symbol),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::View)
      end
      def update(
        view_id,
        object_id_:,
        object_type:,
        name: nil,
        options: nil,
        user_id: nil,
        view_data: nil,
        view_type: nil,
        request_options: {}
      )
      end

      # List out all views. The views are sorted by creation date, with the most
      #   recently-created views coming first
      sig do
        params(
          object_id_: String,
          object_type: Symbol,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          starting_after: String,
          view_name: String,
          view_type: T.nilable(Symbol),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::View])
      end
      def list(
        object_id_:,
        object_type:,
        ending_before: nil,
        ids: nil,
        limit: nil,
        starting_after: nil,
        view_name: nil,
        view_type: nil,
        request_options: {}
      )
      end

      # Delete a view object by its id
      sig do
        params(
          view_id: String,
          object_id_: String,
          object_type: Symbol,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::View)
      end
      def delete(view_id, object_id_:, object_type:, request_options: {})
      end

      # Create or replace view. If there is an existing view with the same name as the
      #   one specified in the request, will replace the existing view with the provided
      #   fields
      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Symbol,
          view_type: T.nilable(Symbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(Braintrust::Models::ViewOptions),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::Models::ViewData),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::View)
      end
      def replace(
        name:,
        object_id_:,
        object_type:,
        view_type:,
        deleted_at: nil,
        options: nil,
        user_id: nil,
        view_data: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
