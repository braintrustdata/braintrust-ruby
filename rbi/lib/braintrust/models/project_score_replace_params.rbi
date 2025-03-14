# typed: strong

module Braintrust
  module Models
    class ProjectScoreReplaceParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      sig { returns(Symbol) }
      def score_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def score_type=(_)
      end

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
          score_type: Symbol,
          categories: T.nilable(
            T.any(T::Array[Braintrust::Models::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          ),
          config: T.nilable(Braintrust::Models::ProjectScoreConfig),
          description: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
              score_type: Symbol,
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

      class Categories < Braintrust::Union
        abstract!

        ProjectScoreCategoryArray = T.type_alias { T::Array[Braintrust::Models::ProjectScoreCategory] }

        FloatMap = T.type_alias { T::Hash[Symbol, Float] }

        StringArray = T.type_alias { T::Array[String] }

        class << self
          sig do
            override
              .returns(
                [[NilClass, T::Array[Braintrust::Models::ProjectScoreCategory]], [NilClass, T::Hash[Symbol, Float]], [NilClass, T::Array[String]]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
