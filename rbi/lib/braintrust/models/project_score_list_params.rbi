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

      # Filter search results to within a particular organization
      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: String).returns(String) }
      def org_name=(_)
      end

      # Project id
      sig { returns(T.nilable(String)) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Name of the project to search for
      sig { returns(T.nilable(String)) }
      def project_name
      end

      sig { params(_: String).returns(String) }
      def project_name=(_)
      end

      # Name of the project_score to search for
      sig { returns(T.nilable(String)) }
      def project_score_name
      end

      sig { params(_: String).returns(String) }
      def project_score_name=(_)
      end

      # The type of the configured score
      sig { returns(T.nilable(T.any(Symbol, T::Array[Symbol]))) }
      def score_type
      end

      sig { params(_: T.any(Symbol, T::Array[Symbol])).returns(T.any(Symbol, T::Array[Symbol])) }
      def score_type=(_)
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
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          project_score_name: String,
          score_type: T.any(Symbol, T::Array[Symbol]),
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
              score_type: T.any(Symbol, T::Array[Symbol]),
              starting_after: String,
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

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)
      end

      # The type of the configured score
      class ScoreType < Braintrust::Union
        abstract!

        Variants = type_template(:out) { {fixed: T.any(Symbol, T::Array[Symbol])} }

        ProjectScoreTypeArray =
          T.let(Braintrust::ArrayOf[enum: Braintrust::Models::ProjectScoreType], Braintrust::Converter)
      end
    end
  end
end
