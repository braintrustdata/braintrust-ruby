# typed: strong

module Braintrust
  module Models
    class UserListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::UserListParams, Braintrust::Internal::AnyHash)
        end

      # Email of the user to search for. You may pass the param multiple times to filter
      # for more than one email
      sig { returns(T.nilable(Braintrust::UserListParams::Email::Variants)) }
      attr_reader :email

      sig { params(email: Braintrust::UserListParams::Email::Variants).void }
      attr_writer :email

      # Pagination cursor id.
      #
      # For example, if the initial item in the last page you fetched had an id of
      # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      # pass one of `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :ending_before

      sig { params(ending_before: String).void }
      attr_writer :ending_before

      # Family name of the user to search for. You may pass the param multiple times to
      # filter for more than one family name
      sig do
        returns(T.nilable(Braintrust::UserListParams::FamilyName::Variants))
      end
      attr_reader :family_name

      sig do
        params(
          family_name: Braintrust::UserListParams::FamilyName::Variants
        ).void
      end
      attr_writer :family_name

      # Given name of the user to search for. You may pass the param multiple times to
      # filter for more than one given name
      sig do
        returns(T.nilable(Braintrust::UserListParams::GivenName::Variants))
      end
      attr_reader :given_name

      sig do
        params(given_name: Braintrust::UserListParams::GivenName::Variants).void
      end
      attr_writer :given_name

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      sig { returns(T.nilable(Braintrust::UserListParams::IDs::Variants)) }
      attr_reader :ids

      sig { params(ids: Braintrust::UserListParams::IDs::Variants).void }
      attr_writer :ids

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # Filter search results to within a particular organization
      sig { returns(T.nilable(String)) }
      attr_reader :org_name

      sig { params(org_name: String).void }
      attr_writer :org_name

      # Pagination cursor id.
      #
      # For example, if the final item in the last page you fetched had an id of `foo`,
      # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      # `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :starting_after

      sig { params(starting_after: String).void }
      attr_writer :starting_after

      sig do
        params(
          email: Braintrust::UserListParams::Email::Variants,
          ending_before: String,
          family_name: Braintrust::UserListParams::FamilyName::Variants,
          given_name: Braintrust::UserListParams::GivenName::Variants,
          ids: Braintrust::UserListParams::IDs::Variants,
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Email of the user to search for. You may pass the param multiple times to filter
        # for more than one email
        email: nil,
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Family name of the user to search for. You may pass the param multiple times to
        # filter for more than one family name
        family_name: nil,
        # Given name of the user to search for. You may pass the param multiple times to
        # filter for more than one given name
        given_name: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            email: Braintrust::UserListParams::Email::Variants,
            ending_before: String,
            family_name: Braintrust::UserListParams::FamilyName::Variants,
            given_name: Braintrust::UserListParams::GivenName::Variants,
            ids: Braintrust::UserListParams::IDs::Variants,
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
      # for more than one email
      module Email
        extend Braintrust::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(
            T::Array[Braintrust::UserListParams::Email::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[String],
            Braintrust::Internal::Type::Converter
          )
      end

      # Family name of the user to search for. You may pass the param multiple times to
      # filter for more than one family name
      module FamilyName
        extend Braintrust::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(
            T::Array[Braintrust::UserListParams::FamilyName::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[String],
            Braintrust::Internal::Type::Converter
          )
      end

      # Given name of the user to search for. You may pass the param multiple times to
      # filter for more than one given name
      module GivenName
        extend Braintrust::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(
            T::Array[Braintrust::UserListParams::GivenName::Variants]
          )
        end
        def self.variants
        end

        StringArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[String],
            Braintrust::Internal::Type::Converter
          )
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(T::Array[Braintrust::UserListParams::IDs::Variants])
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
