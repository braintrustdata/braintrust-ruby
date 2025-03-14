# typed: strong

module Braintrust
  module Models
    class ProjectScore < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

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

      sig { returns(String) }
      def user_id
      end

      sig { params(_: String).returns(String) }
      def user_id=(_)
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

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(String)) }
      def position
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def position=(_)
      end

      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          score_type: Symbol,
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
              score_type: Symbol,
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
