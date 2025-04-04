# typed: strong

module Braintrust
  module Models
    class AISecretListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Name of the ai_secret to search for
      sig { returns(T.nilable(String)) }
      attr_reader :ai_secret_name

      sig { params(ai_secret_name: String).void }
      attr_writer :ai_secret_name

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      attr_reader :ai_secret_type

      sig { params(ai_secret_type: T.any(String, T::Array[String])).void }
      attr_writer :ai_secret_type

      # Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :ending_before

      sig { params(ending_before: String).void }
      attr_writer :ending_before

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
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

      # Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      attr_reader :starting_after

      sig { params(starting_after: String).void }
      attr_writer :starting_after

      sig do
        params(
          ai_secret_name: String,
          ai_secret_type: T.any(String, T::Array[String]),
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        ai_secret_name: nil,
        ai_secret_type: nil,
        ending_before: nil,
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
              ai_secret_name: String,
              ai_secret_type: T.any(String, T::Array[String]),
              ending_before: String,
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

      module AISecretType
        extend Braintrust::Internal::Type::Union

        sig { override.returns([String, T::Array[String]]) }
        def self.variants
        end

        StringArray = T.let(
          Braintrust::Internal::Type::ArrayOf[String],
          Braintrust::Internal::Type::Converter
        )
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        sig { override.returns([String, T::Array[String]]) }
        def self.variants
        end

        StringArray = T.let(
          Braintrust::Internal::Type::ArrayOf[String],
          Braintrust::Internal::Type::Converter
        )
      end
    end
  end
end
