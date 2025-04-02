# typed: strong

module Braintrust
  module Resources
    class ProjectScores
      # Create a new project_score. If there is an existing project_score in the project
      #   with the same name as the one specified in the request, will return the existing
      #   project_score unmodified
      sig do
        params(
          name: String,
          project_id: String,
          score_type: Braintrust::Models::ProjectScoreType::OrSymbol,
          categories: T.nilable(
            T.any(
              T::Array[T.any(Braintrust::Models::ProjectScoreCategory, Braintrust::Util::AnyHash)],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          ),
          config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Util::AnyHash)),
          description: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def create(
        # Name of the project score
        name:,
        # Unique identifier for the project that the project score belongs under
        project_id:,
        # The type of the configured score
        score_type:,
        # For categorical-type project scores, the list of all categories
        categories: nil,
        config: nil,
        # Textual description of the project score
        description: nil,
        request_options: {}
      )
      end

      # Get a project_score object by its id
      sig do
        params(
          project_score_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def retrieve(
        # ProjectScore id
        project_score_id,
        request_options: {}
      )
      end

      # Partially update a project_score object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      sig do
        params(
          project_score_id: String,
          categories: T.nilable(
            T.any(
              T::Array[T.any(Braintrust::Models::ProjectScoreCategory, Braintrust::Util::AnyHash)],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          ),
          config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Util::AnyHash)),
          description: T.nilable(String),
          name: T.nilable(String),
          score_type: T.nilable(Braintrust::Models::ProjectScoreType::OrSymbol),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def update(
        # ProjectScore id
        project_score_id,
        # For categorical-type project scores, the list of all categories
        categories: nil,
        config: nil,
        # Textual description of the project score
        description: nil,
        # Name of the project score
        name: nil,
        # The type of the configured score
        score_type: nil,
        request_options: {}
      )
      end

      # List out all project_scores. The project_scores are sorted by creation date,
      #   with the most recently-created project_scores coming first
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::ProjectScore])
      end
      def list(
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
        # Filter search results to within a particular organization
        org_name: nil,
        # Project id
        project_id: nil,
        # Name of the project to search for
        project_name: nil,
        # Name of the project_score to search for
        project_score_name: nil,
        # The type of the configured score
        score_type: nil,
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete a project_score object by its id
      sig do
        params(
          project_score_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def delete(
        # ProjectScore id
        project_score_id,
        request_options: {}
      )
      end

      # Create or replace project_score. If there is an existing project_score in the
      #   project with the same name as the one specified in the request, will replace the
      #   existing project_score with the provided fields
      sig do
        params(
          name: String,
          project_id: String,
          score_type: Braintrust::Models::ProjectScoreType::OrSymbol,
          categories: T.nilable(
            T.any(
              T::Array[T.any(Braintrust::Models::ProjectScoreCategory, Braintrust::Util::AnyHash)],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          ),
          config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Util::AnyHash)),
          description: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def replace(
        # Name of the project score
        name:,
        # Unique identifier for the project that the project score belongs under
        project_id:,
        # The type of the configured score
        score_type:,
        # For categorical-type project scores, the list of all categories
        categories: nil,
        config: nil,
        # Textual description of the project score
        description: nil,
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
