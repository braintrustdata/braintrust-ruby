# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectScores#update
    class ProjectScoreUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      optional :categories, union: -> { Braintrust::ProjectScoreUpdateParams::Categories }, nil?: true

      # @!attribute config
      #
      #   @return [Braintrust::ProjectScoreConfig, nil]
      optional :config, -> { Braintrust::ProjectScoreConfig }, nil?: true

      # @!attribute description
      #   Textual description of the project score
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #   Name of the project score
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute score_type
      #   The type of the configured score
      #
      #   @return [Symbol, Braintrust::ProjectScoreType, nil]
      optional :score_type, enum: -> { Braintrust::ProjectScoreType }, nil?: true

      # @!method initialize(categories: nil, config: nil, description: nil, name: nil, score_type: nil, request_options: {})
      #   @param categories [Array<Braintrust::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil] For categorical-type project scores, the list of all categories
      #
      #   @param config [Braintrust::ProjectScoreConfig, nil]
      #
      #   @param description [String, nil] Textual description of the project score
      #
      #   @param name [String, nil] Name of the project score
      #
      #   @param score_type [Symbol, Braintrust::ProjectScoreType, nil] The type of the configured score
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Internal::Type::Union

        # For categorical-type project scores, the list of all categories
        variant -> { Braintrust::ProjectScoreUpdateParams::Categories::ProjectScoreCategoryArray }

        # For weighted-type project scores, the weights of each score
        variant -> { Braintrust::ProjectScoreUpdateParams::Categories::FloatMap }

        # For minimum-type project scores, the list of included scores
        variant -> { Braintrust::ProjectScoreUpdateParams::Categories::StringArray }

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
