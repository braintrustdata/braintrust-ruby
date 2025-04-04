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
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          view_type: T.nilable(Braintrust::Models::ViewCreateParams::ViewType::OrSymbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Internal::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Internal::AnyHash)),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::View)
      end
      def create(
        # Name of the view
        name:,
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Type of table that the view corresponds to.
        view_type:,
        # Date of role deletion, or null if the role is still active
        deleted_at: nil,
        # Options for the view in the app
        options: nil,
        # Identifies the user who created the view
        user_id: nil,
        # The view definition
        view_data: nil,
        request_options: {}
      )
      end

      # Get a view object by its id
      sig do
        params(
          view_id: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::View)
      end
      def retrieve(
        # View id
        view_id,
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        request_options: {}
      )
      end

      # Partially update a view object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      sig do
        params(
          view_id: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          name: T.nilable(String),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Internal::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Internal::AnyHash)),
          view_type: T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::View)
      end
      def update(
        # View id
        view_id,
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Name of the view
        name: nil,
        # Options for the view in the app
        options: nil,
        # Identifies the user who created the view
        user_id: nil,
        # The view definition
        view_data: nil,
        # Type of table that the view corresponds to.
        view_type: nil,
        request_options: {}
      )
      end

      # List out all views. The views are sorted by creation date, with the most
      #   recently-created views coming first
      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          starting_after: String,
          view_name: String,
          view_type: T.nilable(Braintrust::Models::ViewType::OrSymbol),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::View])
      end
      def list(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Pagination cursor id.
        #
        #   For example, if the initial item in the last page you fetched had an id of
        #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        #   pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        #   IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        # Name of the view to search for
        view_name: nil,
        # Type of table that the view corresponds to.
        view_type: nil,
        request_options: {}
      )
      end

      # Delete a view object by its id
      sig do
        params(
          view_id: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::View)
      end
      def delete(
        # View id
        view_id,
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        request_options: {}
      )
      end

      # Create or replace view. If there is an existing view with the same name as the
      #   one specified in the request, will replace the existing view with the provided
      #   fields
      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          view_type: T.nilable(Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Internal::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Internal::AnyHash)),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::View)
      end
      def replace(
        # Name of the view
        name:,
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Type of table that the view corresponds to.
        view_type:,
        # Date of role deletion, or null if the role is still active
        deleted_at: nil,
        # Options for the view in the app
        options: nil,
        # Identifies the user who created the view
        user_id: nil,
        # The view definition
        view_data: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
