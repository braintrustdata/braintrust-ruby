# typed: strong

module Braintrust
  module Models
    class ProjectScoreUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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

      # Name of the project score
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The type of the configured score
      sig { returns(T.nilable(Braintrust::Models::ProjectScoreType::OrSymbol)) }
      attr_accessor :score_type

      sig do
        params(
          categories: T.nilable(
            T.any(
              T::Array[T.any(Braintrust::Models::ProjectScoreCategory, Braintrust::Internal::AnyHash)],
              T::Hash[Symbol, Float],
              T::Array[String]
            )
          ),
          config: T.nilable(T.any(Braintrust::Models::ProjectScoreConfig, Braintrust::Internal::AnyHash)),
          description: T.nilable(String),
          name: T.nilable(String),
          score_type: T.nilable(Braintrust::Models::ProjectScoreType::OrSymbol),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        categories: nil,
        config: nil,
        description: nil,
        name: nil,
        score_type: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              categories: T.nilable(
                T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
              ),
              config: T.nilable(Braintrust::Models::ProjectScoreConfig),
              description: T.nilable(String),
              name: T.nilable(String),
              score_type: T.nilable(Braintrust::Models::ProjectScoreType::OrSymbol),
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
