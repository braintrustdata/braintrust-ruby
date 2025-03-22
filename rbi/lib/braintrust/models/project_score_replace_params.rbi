# typed: strong

module Braintrust
  module Models
    class ProjectScoreReplaceParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      sig { returns(Braintrust::Models::ProjectScoreType::OrSymbol) }
      def score_type
      end

      sig do
        params(_: Braintrust::Models::ProjectScoreType::OrSymbol)
          .returns(Braintrust::Models::ProjectScoreType::OrSymbol)
      end
      def score_type=(_)
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

      # Textual description of the project score
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

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
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {})
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
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {fixed: T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])}
          end

        ProjectScoreCategoryArray =
          T.let(Braintrust::ArrayOf[Braintrust::Models::ProjectScoreCategory], Braintrust::Converter)

        FloatMap = T.let(Braintrust::HashOf[Float], Braintrust::Converter)

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)

        class << self
          sig do
            override
              .returns([T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String]])
          end
          def variants
          end
        end
      end
    end
  end
end
