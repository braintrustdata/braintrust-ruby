# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectScores#replace
    class ProjectScoreReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the project score
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the project score belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute score_type
      #   The type of the configured score
      #
      #   @return [Symbol, Braintrust::ProjectScoreType]
      required :score_type, enum: -> { Braintrust::ProjectScoreType }

      # @!attribute categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      optional :categories, union: -> { Braintrust::ProjectScoreReplaceParams::Categories }, nil?: true

      # @!attribute config
      #
      #   @return [Braintrust::ProjectScoreConfig, nil]
      optional :config, -> { Braintrust::ProjectScoreConfig }, nil?: true

      # @!attribute description
      #   Textual description of the project score
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!method initialize(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {})
      #   @param name [String] Name of the project score
      #
      #   @param project_id [String] Unique identifier for the project that the project score belongs under
      #
      #   @param score_type [Symbol, Braintrust::ProjectScoreType] The type of the configured score
      #
      #   @param categories [Array<Braintrust::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil] For categorical-type project scores, the list of all categories
      #
      #   @param config [Braintrust::ProjectScoreConfig, nil]
      #
      #   @param description [String, nil] Textual description of the project score
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Internal::Type::Union

        # For categorical-type project scores, the list of all categories
        variant -> { Braintrust::ProjectScoreReplaceParams::Categories::ProjectScoreCategoryArray }

        # For weighted-type project scores, the weights of each score
        variant -> { Braintrust::ProjectScoreReplaceParams::Categories::FloatMap }

        # For minimum-type project scores, the list of included scores
        variant -> { Braintrust::ProjectScoreReplaceParams::Categories::StringArray }

        # @!method self.variants
        #   @return [Array(Array<Braintrust::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(T::Array[Braintrust::ProjectScoreCategory], T::Hash[Symbol, Float], T::Array[String])
          end
        end

        # @type [Braintrust::Internal::Type::Converter]
        ProjectScoreCategoryArray = Braintrust::Internal::Type::ArrayOf[-> {
          Braintrust::ProjectScoreCategory
        }]

        # @type [Braintrust::Internal::Type::Converter]
        FloatMap = Braintrust::Internal::Type::HashOf[Float]

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
