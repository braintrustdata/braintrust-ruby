# typed: strong

module Braintrust
  module Models
    class ProjectScore < Braintrust::Internal::Type::BaseModel
      # Unique identifier for the project score
      sig { returns(String) }
      attr_accessor :id

      # Name of the project score
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the project score belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # The type of the configured score
      sig { returns(Braintrust::Models::ProjectScoreType::TaggedSymbol) }
      attr_accessor :score_type

      sig { returns(String) }
      attr_accessor :user_id

      # For categorical-type project scores, the list of all categories
      sig do
        returns(
          T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          )
        )
      end
      attr_accessor :categories

      sig { returns(T.nilable(Braintrust::Models::ProjectScoreConfig)) }
      attr_reader :config

      sig do
        params(config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Internal::AnyHash)))
          .void
      end
      attr_writer :config

      # Date of project score creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Textual description of the project score
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # An optional LexoRank-based string that sets the sort position for the score in
      #   the UI
      sig { returns(T.nilable(String)) }
      attr_accessor :position

      # A project score is a user-configured score, which can be manually-labeled
      #   through the UI
      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          score_type: Braintrust::Models::ProjectScoreType::OrSymbol,
          user_id: String,
          categories: T.nilable(
            T.any(
              T::Array[T.any(Braintrust::Models::ProjectScoreCategory, Braintrust::Internal::AnyHash)],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          ),
          config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Internal::AnyHash)),
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
      ); end
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
      def to_hash; end

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Internal::Type::Union

        sig do
          override
            .returns([T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String]])
        end
        def self.variants; end

        ProjectScoreCategoryArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[Braintrust::Models::ProjectScoreCategory],
            Braintrust::Internal::Type::Converter
          )

        FloatMap = T.let(Braintrust::Internal::Type::HashOf[Float], Braintrust::Internal::Type::Converter)

        StringArray = T.let(
          Braintrust::Internal::Type::ArrayOf[String],
          Braintrust::Internal::Type::Converter
        )
      end
    end
  end
end
