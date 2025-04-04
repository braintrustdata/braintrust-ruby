# typed: strong

module Braintrust
  module Models
    class ProjectScoreCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Name of the project score
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the project score belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # The type of the configured score
      sig { returns(Braintrust::Models::ProjectScoreType::OrSymbol) }
      attr_accessor :score_type

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

      # Textual description of the project score
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig do
        params(
          name: String,
          project_id: String,
          score_type: Braintrust::Models::ProjectScoreType::OrSymbol,
          categories: T.nilable(
            T.any(
              T::Array[T.any(Braintrust::Models::ProjectScoreCategory, Braintrust::Internal::AnyHash)],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          ),
          config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Internal::AnyHash)),
          description: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
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
        override
          .returns(
            {
              name: String,
              project_id: String,
              score_type: Braintrust::Models::ProjectScoreType::OrSymbol,
              categories: T.nilable(
                T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
              ),
              config: T.nilable(Braintrust::Models::ProjectScoreConfig),
              description: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Internal::Type::Union

        sig do
          override
            .returns([T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String]])
        end
        def self.variants
        end

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
