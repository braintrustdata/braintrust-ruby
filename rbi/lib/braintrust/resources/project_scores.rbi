# typed: strong

module Braintrust
  module Resources
    class ProjectScores
      sig do
        params(
          name: String,
          project_id: String,
          score_type: Symbol,
          categories: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          description: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def create(
        name:,
        project_id:,
        score_type:,
        categories: nil,
        config: nil,
        description: nil,
        request_options: {}
      )
      end

      sig do
        params(
          project_score_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def retrieve(project_score_id, request_options: {})
      end

      sig do
        params(
          project_score_id: String,
          categories: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          description: T.nilable(String),
          name: T.nilable(String),
          score_type: T.nilable(Symbol),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def update(
        project_score_id,
        categories: nil,
        config: nil,
        description: nil,
        name: nil,
        score_type: nil,
        request_options: {}
      )
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::ProjectScore])
      end
      def list(
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
        params(
          project_score_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def delete(project_score_id, request_options: {})
      end

      sig do
        params(
          name: String,
          project_id: String,
          score_type: Symbol,
          categories: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          description: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectScore)
      end
      def replace(
        name:,
        project_id:,
        score_type:,
        categories: nil,
        config: nil,
        description: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
