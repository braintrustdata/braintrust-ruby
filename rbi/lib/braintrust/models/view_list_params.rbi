# typed: strong

module Braintrust
  module Models
    class ViewListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The id of the object the ACL applies to
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The object type that the ACL applies to
      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      # Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      def ending_before
      end

      sig { params(_: String).returns(String) }
      def ending_before=(_)
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ids
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ids=(_)
      end

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      # Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      def starting_after
      end

      sig { params(_: String).returns(String) }
      def starting_after=(_)
      end

      # Name of the view to search for
      sig { returns(T.nilable(String)) }
      def view_name
      end

      sig { params(_: String).returns(String) }
      def view_name=(_)
      end

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Symbol)) }
      def view_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def view_type=(_)
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
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
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
        override
          .returns(
            {
              object_id_: String,
              object_type: Symbol,
              ending_before: String,
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              starting_after: String,
              view_name: String,
              view_type: T.nilable(Symbol),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      class IDs < Braintrust::Union
        abstract!

        Variants = type_template(:out) { {fixed: T.any(String, T::Array[String])} }

        StringArray = T.type_alias { T::Array[String] }
      end
    end
  end
end
