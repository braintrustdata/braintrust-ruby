# typed: strong

module Braintrust
  module Resources
    class Views
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

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
