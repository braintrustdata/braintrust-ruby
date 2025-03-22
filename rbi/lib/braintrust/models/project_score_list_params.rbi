# typed: strong

module Braintrust
  module Models
    class ProjectScoreListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      # Name of the project_score to search for
      sig { returns(T.nilable(String)) }
      attr_reader :project_score_name

      sig { params(project_score_name: String).void }
      attr_writer :project_score_name

      # The type of the configured score
      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::Models::ProjectScoreType::OrSymbol,
              T::Array[Braintrust::Models::ProjectScoreType::OrSymbol]
            )
          )
        )
      end
      attr_reader :score_type

      sig do
        params(
          score_type: T.any(
            Braintrust::Models::ProjectScoreType::OrSymbol,
            T::Array[Braintrust::Models::ProjectScoreType::OrSymbol]
          )
        )
          .void
      end
      attr_writer :score_type

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
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          project_score_name: String,
          score_type: T.any(
            Braintrust::Models::ProjectScoreType::OrSymbol,
            T::Array[Braintrust::Models::ProjectScoreType::OrSymbol]
          ),
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        project_score_name: nil,
        score_type: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              ending_before: String,
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              org_name: String,
              project_id: String,
              project_name: String,
              project_score_name: String,
              score_type: T.any(
                Braintrust::Models::ProjectScoreType::OrSymbol,
                T::Array[Braintrust::Models::ProjectScoreType::OrSymbol]
              ),
              starting_after: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      module IDs
        extend Braintrust::Union

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)

        sig { override.returns([String, T::Array[String]]) }
        def self.variants
        end
      end

      # The type of the configured score
      module ScoreType
        extend Braintrust::Union

        ProjectScoreTypeArray =
          T.let(Braintrust::ArrayOf[enum: Braintrust::Models::ProjectScoreType], Braintrust::Converter)

        sig do
          override
            .returns(
              [Braintrust::Models::ProjectScoreType::OrSymbol, T::Array[Braintrust::Models::ProjectScoreType::OrSymbol]]
            )
        end
        def self.variants
        end
      end
    end
  end
end
