# typed: strong

module Braintrust
  module Models
    class ProjectScore < Braintrust::BaseModel
      # Unique identifier for the project score
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the project score
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the project score belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # The type of the configured score
      sig { returns(Braintrust::Models::ProjectScoreType::TaggedSymbol) }
      def score_type
      end

      sig do
        params(_: Braintrust::Models::ProjectScoreType::TaggedSymbol)
          .returns(Braintrust::Models::ProjectScoreType::TaggedSymbol)
      end
      def score_type=(_)
      end

      sig { returns(String) }
      def user_id
      end

      sig { params(_: String).returns(String) }
      def user_id=(_)
      end

      # For categorical-type project scores, the list of all categories
      sig do
        returns(
          T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          )
        )
      end
      def categories
      end

      sig do
        params(
          _: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          )
        )
          .returns(
            T.nilable(
              T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
            )
          )
      end
      def categories=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ProjectScoreConfig)) }
      def config
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Util::AnyHash)))
      end
      def config=(_)
      end

      # Date of project score creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Textual description of the project score
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # An optional LexoRank-based string that sets the sort position for the score in
      #   the UI
      sig { returns(T.nilable(String)) }
      def position
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def position=(_)
      end

      # A project score is a user-configured score, which can be manually-labeled
      #   through the UI
      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          score_type: Braintrust::Models::ProjectScoreType::TaggedSymbol,
          user_id: String,
          categories: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          created: T.nilable(Time),
          description: T.nilable(String),
          position: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        project_id:,
        score_type:,
        user_id:,
        categories: nil,
        config: nil,
        created: nil,
        description: nil,
        position: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              project_id: String,
              score_type: Braintrust::Models::ProjectScoreType::TaggedSymbol,
              user_id: String,
              categories: T.nilable(
                T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
              ),
              config: T.nilable(Braintrust::Models::ProjectScoreConfig),
              created: T.nilable(Time),
              description: T.nilable(String),
              position: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {fixed: T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])}
          end

        ProjectScoreCategoryArray =
          T.let(Braintrust::ArrayOf[Braintrust::Models::ProjectScoreCategory], Braintrust::Converter)

        FloatMap = T.let(Braintrust::HashOf[Float], Braintrust::Converter)

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)
      end
    end
  end
end
