# typed: strong

module Braintrust
  module Models
    class RoleListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::RoleListParams, Braintrust::Internal::AnyHash)
        end

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
      sig { returns(T.nilable(Braintrust::RoleListParams::IDs::Variants)) }
      attr_reader :ids

      sig { params(ids: Braintrust::RoleListParams::IDs::Variants).void }
      attr_writer :ids

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # Filter search results to within a particular organization
      sig { returns(T.nilable(String)) }
      attr_reader :org_name

      sig { params(org_name: String).void }
      attr_writer :org_name

      # Name of the role to search for
      sig { returns(T.nilable(String)) }
      attr_reader :role_name

      sig { params(role_name: String).void }
      attr_writer :role_name

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
          ending_before: String,
          ids: Braintrust::RoleListParams::IDs::Variants,
          limit: T.nilable(Integer),
          org_name: String,
          role_name: String,
          starting_after: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        # Filter search results to within a particular organization
        org_name: nil,
        # Name of the role to search for
        role_name: nil,
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
            ending_before: String,
            ids: Braintrust::RoleListParams::IDs::Variants,
            limit: T.nilable(Integer),
            org_name: String,
            role_name: String,
            starting_after: String,
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
          override.returns(T::Array[Braintrust::RoleListParams::IDs::Variants])
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
