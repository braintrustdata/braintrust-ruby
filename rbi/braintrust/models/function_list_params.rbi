# typed: strong

module Braintrust
  module Models
    class FunctionListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Pagination cursor id.
      #
      # For example, if the initial item in the last page you fetched had an id of
      # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      # pass one of `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :ending_before

      sig { params(ending_before: String).void }
      attr_writer :ending_before

      # Name of the function to search for
      sig { returns(T.nilable(String)) }
      attr_reader :function_name

      sig { params(function_name: String).void }
      attr_writer :function_name

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      attr_reader :ids

      sig { params(ids: T.any(String, T::Array[String])).void }
      attr_writer :ids

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # Filter search results to within a particular organization
      sig { returns(T.nilable(String)) }
      attr_reader :org_name

      sig { params(org_name: String).void }
      attr_writer :org_name

      # Project id
      sig { returns(T.nilable(String)) }
      attr_reader :project_id

      sig { params(project_id: String).void }
      attr_writer :project_id

      # Name of the project to search for
      sig { returns(T.nilable(String)) }
      attr_reader :project_name

      sig { params(project_name: String).void }
      attr_writer :project_name

      # Retrieve prompt with a specific slug
      sig { returns(T.nilable(String)) }
      attr_reader :slug

      sig { params(slug: String).void }
      attr_writer :slug

      # Pagination cursor id.
      #
      # For example, if the final item in the last page you fetched had an id of `foo`,
      # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      # `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :starting_after

      sig { params(starting_after: String).void }
      attr_writer :starting_after

      # Retrieve prompt at a specific version.
      #
      # The version id can either be a transaction id (e.g. '1000192656880881099') or a
      # version identifier (e.g. '81cd05ee665fdfb3').
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      sig do
        params(
          ending_before: String,
          function_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          slug: String,
          starting_after: String,
          version: String,
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
        # Name of the function to search for
        function_name: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Project id
        project_id: nil,
        # Name of the project to search for
        project_name: nil,
        # Retrieve prompt with a specific slug
        slug: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        # Retrieve prompt at a specific version.
        #
        # The version id can either be a transaction id (e.g. '1000192656880881099') or a
        # version identifier (e.g. '81cd05ee665fdfb3').
        version: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            ending_before: String,
            function_name: String,
            ids: T.any(String, T::Array[String]),
            limit: T.nilable(Integer),
            org_name: String,
            project_id: String,
            project_name: String,
            slug: String,
            starting_after: String,
            version: String,
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
          override.returns(
            T::Array[Braintrust::FunctionListParams::IDs::Variants]
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
    end
  end
end
