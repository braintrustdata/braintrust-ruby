# typed: strong

module Braintrust
  module Models
    class ProjectScoreUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::ProjectScoreUpdateParams,
            Braintrust::Internal::AnyHash
          )
        end

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

      # Textual description of the project score
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the project score
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The type of the configured score
      sig { returns(T.nilable(Braintrust::ProjectScoreType::OrSymbol)) }
      attr_accessor :score_type

      sig do
        params(
          categories:
            T.nilable(
              T.any(
                T::Array[Braintrust::ProjectScoreCategory::OrHash],
                T::Hash[Symbol, Float],
                T::Array[String]
              )
            ),
          config: T.nilable(Braintrust::ProjectScoreConfig::OrHash),
          description: T.nilable(String),
          name: T.nilable(String),
          score_type: T.nilable(Braintrust::ProjectScoreType::OrSymbol),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # For categorical-type project scores, the list of all categories
        categories: nil,
        config: nil,
        # Textual description of the project score
        description: nil,
        # Name of the project score
        name: nil,
        # The type of the configured score
        score_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            categories:
              T.nilable(
                T.any(
                  T::Array[Braintrust::ProjectScoreCategory],
                  T::Hash[Symbol, Float],
                  T::Array[String]
                )
              ),
            config: T.nilable(Braintrust::ProjectScoreConfig),
            description: T.nilable(String),
            name: T.nilable(String),
            score_type: T.nilable(Braintrust::ProjectScoreType::OrSymbol),
            request_options: Braintrust::RequestOptions
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
            T::Array[Braintrust::ProjectScoreUpdateParams::Categories::Variants]
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
