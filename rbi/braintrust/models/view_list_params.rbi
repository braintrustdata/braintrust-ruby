# typed: strong

module Braintrust
  module Models
    class ViewListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::ViewListParams, Braintrust::Internal::AnyHash)
        end

      # The id of the object the ACL applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Pagination cursor id.
      #
      # For example, if the initial item in the last page you fetched had an id of
      # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      # pass one of `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :ending_before

      sig { params(ending_before: String).void }
      attr_writer :ending_before

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      attr_reader :ids

      sig { params(ids: T.any(String, T::Array[String])).void }
      attr_writer :ids

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # Pagination cursor id.
      #
      # For example, if the final item in the last page you fetched had an id of `foo`,
      # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      # `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :starting_after

      sig { params(starting_after: String).void }
      attr_writer :starting_after

      # Name of the view to search for
      sig { returns(T.nilable(String)) }
      attr_reader :view_name

      sig { params(view_name: String).void }
      attr_writer :view_name

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::ViewType::OrSymbol)) }
      attr_accessor :view_type

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::ACLObjectType::OrSymbol,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          starting_after: String,
          view_name: String,
          view_type: T.nilable(Braintrust::ViewType::OrSymbol),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        # Name of the view to search for
        view_name: nil,
        # Type of table that the view corresponds to.
        view_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            object_id_: String,
            object_type: Braintrust::ACLObjectType::OrSymbol,
            ending_before: String,
            ids: T.any(String, T::Array[String]),
            limit: T.nilable(Integer),
            starting_after: String,
            view_name: String,
            view_type: T.nilable(Braintrust::ViewType::OrSymbol),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(T::Array[Braintrust::ViewListParams::IDs::Variants])
        end
        def self.variants
        end

        StringArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[String],
            Braintrust::Internal::Type::Converter
          )
      end
    end
  end
end
