# typed: strong

module Braintrust
  module Models
    class ProjectScore < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
      sig { returns(Braintrust::ProjectScoreType::TaggedSymbol) }
      attr_accessor :score_type

      sig { returns(String) }
      attr_accessor :user_id

      # For categorical-type project scores, the list of all categories
      sig do
        returns(
          T.nilable(
            T.any(
              T::Array[Braintrust::ProjectScoreCategory],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          )
        )
      end
      attr_accessor :categories

      sig { returns(T.nilable(Braintrust::ProjectScoreConfig)) }
      attr_reader :config

      sig do
        params(config: T.nilable(Braintrust::ProjectScoreConfig::OrHash)).void
      end
      attr_writer :config

      # Date of project score creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Textual description of the project score
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # An optional LexoRank-based string that sets the sort position for the score in
      # the UI
      sig { returns(T.nilable(String)) }
      attr_accessor :position

      # A project score is a user-configured score, which can be manually-labeled
      # through the UI
      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          score_type: Braintrust::ProjectScoreType::OrSymbol,
          user_id: String,
          categories:
            T.nilable(
              T.any(
                T::Array[Braintrust::ProjectScoreCategory::OrHash],
                T::Hash[Symbol, Float],
                T::Array[String]
              )
            ),
          config: T.nilable(Braintrust::ProjectScoreConfig::OrHash),
          created: T.nilable(Time),
          description: T.nilable(String),
          position: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the project score
        id:,
        # Name of the project score
        name:,
        # Unique identifier for the project that the project score belongs under
        project_id:,
        # The type of the configured score
        score_type:,
        user_id:,
        # For categorical-type project scores, the list of all categories
        categories: nil,
        config: nil,
        # Date of project score creation
        created: nil,
        # Textual description of the project score
        description: nil,
        # An optional LexoRank-based string that sets the sort position for the score in
        # the UI
        position: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            project_id: String,
            score_type: Braintrust::ProjectScoreType::TaggedSymbol,
            user_id: String,
            categories:
              T.nilable(
                T.any(
                  T::Array[Braintrust::ProjectScoreCategory],
                  T::Hash[Symbol, Float],
                  T::Array[String]
                )
              ),
            config: T.nilable(Braintrust::ProjectScoreConfig),
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
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Array[Braintrust::ProjectScoreCategory],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          end

        sig do
          override.returns(
            T::Array[Braintrust::ProjectScore::Categories::Variants]
          )
        end
        def self.variants
        end

        ProjectScoreCategoryArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[
              Braintrust::ProjectScoreCategory
            ],
            Braintrust::Internal::Type::Converter
          )

        FloatMap =
          T.let(
            Braintrust::Internal::Type::HashOf[Float],
            Braintrust::Internal::Type::Converter
          )

        StringArray =
          T.let(
            Braintrust::Internal::Type::ArrayOf[String],
            Braintrust::Internal::Type::Converter
          )
      end
    end
  end
end
