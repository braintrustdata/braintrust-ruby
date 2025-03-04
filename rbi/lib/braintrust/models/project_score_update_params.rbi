# typed: strong

module Braintrust
  module Models
    class ProjectScoreUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig do
        returns(
          T.nilable(
            T.any(
              T::Array[Braintrust::Models::ProjectScoreCategory],
              T::Hash[Symbol, Float],
              T::Array[String],
              Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant
            )
          )
        )
      end
      def categories
      end

      sig do
        params(
          _: T.nilable(
            T.any(
              T::Array[Braintrust::Models::ProjectScoreCategory],
              T::Hash[Symbol, Float],
              T::Array[String],
              Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant
            )
          )
        )
          .returns(
            T.nilable(
              T.any(
                T::Array[Braintrust::Models::ProjectScoreCategory],
                T::Hash[Symbol, Float],
                T::Array[String],
                Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant
              )
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

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def score_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def score_type=(_)
      end

      sig do
        params(
          categories: T.nilable(
            T.any(
              T::Array[Braintrust::Models::ProjectScoreCategory],
              T::Hash[Symbol, Float],
              T::Array[String],
              Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant
            )
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          description: T.nilable(String),
          name: T.nilable(String),
          score_type: T.nilable(Symbol),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
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
                T.any(
                  T::Array[Braintrust::Models::ProjectScoreCategory],
                  T::Hash[Symbol, Float],
                  T::Array[String],
                  Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant
                )
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

      class Categories < Braintrust::Union
        abstract!

        ProjectScoreCategoryArray = T.type_alias { T::Array[Braintrust::Models::ProjectScoreCategory] }

        FloatMap = T.type_alias { T::Hash[Symbol, Float] }

        StringArray = T.type_alias { T::Array[String] }

        class NullableVariant < Braintrust::BaseModel
          sig { void }
          def initialize
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        sig do
          override
            .returns(
              [[NilClass, T::Array[Braintrust::Models::ProjectScoreCategory]], [NilClass, T::Hash[Symbol, Float]], [NilClass, T::Array[String]], [NilClass, Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant]]
            )
        end
        private_class_method def self.variants
        end
      end

      class ScoreType < Braintrust::Enum
        abstract!

        SLIDER = T.let(:slider, T.nilable(Symbol))
        CATEGORICAL = T.let(:categorical, T.nilable(Symbol))
        WEIGHTED = T.let(:weighted, T.nilable(Symbol))
        MINIMUM = T.let(:minimum, T.nilable(Symbol))
        MAXIMUM = T.let(:maximum, T.nilable(Symbol))
        ONLINE = T.let(:online, T.nilable(Symbol))

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end
    end
  end
end
