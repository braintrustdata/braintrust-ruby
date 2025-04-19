# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectScores#update
    class ProjectScoreUpdateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      optional :categories, union: -> { Braintrust::Models::ProjectScoreUpdateParams::Categories }, nil?: true

      # @!attribute config
      #
      #   @return [Braintrust::Models::ProjectScoreConfig, nil]
      optional :config, -> { Braintrust::Models::ProjectScoreConfig }, nil?: true

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
      #   @return [Symbol, Braintrust::Models::ProjectScoreType, nil]
      optional :score_type, enum: -> { Braintrust::Models::ProjectScoreType }, nil?: true

      # @!method initialize(categories: nil, config: nil, description: nil, name: nil, score_type: nil, request_options: {})
      #   @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      #   @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #   @param description [String, nil]
      #   @param name [String, nil]
      #   @param score_type [Symbol, Braintrust::Models::ProjectScoreType, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Internal::Type::Union

        # For categorical-type project scores, the list of all categories
        variant -> { Braintrust::Models::ProjectScoreUpdateParams::Categories::ProjectScoreCategoryArray }

        # For weighted-type project scores, the weights of each score
        variant -> { Braintrust::Models::ProjectScoreUpdateParams::Categories::FloatMap }

        # For minimum-type project scores, the list of included scores
        variant -> { Braintrust::Models::ProjectScoreUpdateParams::Categories::StringArray }

        # @!method self.variants
        #   @return [Array(Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>)]

        ProjectScoreCategoryArray =
          Braintrust::Internal::Type::ArrayOf[-> { Braintrust::Models::ProjectScoreCategory }]

        FloatMap = Braintrust::Internal::Type::HashOf[Float]

        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
