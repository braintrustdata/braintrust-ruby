# typed: strong

module Braintrust
  module Models
    class ProjectScoreUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
        params(_: T.nilable(Braintrust::Models::ProjectScoreConfig))
          .returns(T.nilable(Braintrust::Models::ProjectScoreConfig))
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

      # Name of the project score
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      # The type of the configured score
      sig { returns(T.nilable(Symbol)) }
      def score_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def score_type=(_)
      end

      sig do
        params(
          categories: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          description: T.nilable(String),
          name: T.nilable(String),
          score_type: T.nilable(Symbol),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(categories: nil, config: nil, description: nil, name: nil, score_type: nil, request_options: {})
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
              score_type: T.nilable(Symbol),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # For categorical-type project scores, the list of all categories
      class Categories < Braintrust::Union
        abstract!

        ProjectScoreCategoryArray = T.type_alias { T::Array[Braintrust::Models::ProjectScoreCategory] }

        FloatMap = T.type_alias { T::Hash[Symbol, Float] }

        StringArray = T.type_alias { T::Array[String] }

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
