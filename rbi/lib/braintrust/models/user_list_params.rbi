# typed: strong

module Braintrust
  module Models
    class UserListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Email of the user to search for. You may pass the param multiple times to filter
      #   for more than one email
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def email
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def email=(_)
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

      # Family name of the user to search for. You may pass the param multiple times to
      #   filter for more than one family name
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def family_name
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def family_name=(_)
      end

      # Given name of the user to search for. You may pass the param multiple times to
      #   filter for more than one given name
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def given_name
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def given_name=(_)
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

      # Filter search results to within a particular organization
      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: String).returns(String) }
      def org_name=(_)
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

      sig do
        params(
          email: T.any(String, T::Array[String]),
          ending_before: String,
          family_name: T.any(String, T::Array[String]),
          given_name: T.any(String, T::Array[String]),
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        email: nil,
        ending_before: nil,
        family_name: nil,
        given_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              email: T.any(String, T::Array[String]),
              ending_before: String,
              family_name: T.any(String, T::Array[String]),
              given_name: T.any(String, T::Array[String]),
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              org_name: String,
              starting_after: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Email of the user to search for. You may pass the param multiple times to filter
      #   for more than one email
      module Email
        extend Braintrust::Union

        Variants = type_template(:out) { {fixed: T.any(String, T::Array[String])} }

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)
      end

      # Family name of the user to search for. You may pass the param multiple times to
      #   filter for more than one family name
      module FamilyName
        extend Braintrust::Union

        Variants = type_template(:out) { {fixed: T.any(String, T::Array[String])} }

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)
      end

      # Given name of the user to search for. You may pass the param multiple times to
      #   filter for more than one given name
      module GivenName
        extend Braintrust::Union

        Variants = type_template(:out) { {fixed: T.any(String, T::Array[String])} }

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      module IDs
        extend Braintrust::Union

        Variants = type_template(:out) { {fixed: T.any(String, T::Array[String])} }

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)
      end
    end
  end
end
