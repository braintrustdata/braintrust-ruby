# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute [r] categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant, nil]
      optional :categories, union: -> { Braintrust::Models::ProjectScoreUpdateParams::Categories }

      # @!parse
      #   # @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant, nil]
      #   attr_writer :categories

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
      #   @return [Symbol, Braintrust::Models::ProjectScoreUpdateParams::ScoreType, nil]
      optional :score_type, enum: -> { Braintrust::Models::ProjectScoreUpdateParams::ScoreType }, nil?: true

      # @!parse
      #   # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant, nil]
      #   # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #   # @param description [String, nil]
      #   # @param name [String, nil]
      #   # @param score_type [Symbol, Braintrust::Models::ProjectScoreUpdateParams::ScoreType, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(categories: nil, config: nil, description: nil, name: nil, score_type: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # For categorical-type project scores, the list of all categories
      class Categories < Braintrust::Union
        ProjectScoreCategoryArray = Braintrust::ArrayOf[-> { Braintrust::Models::ProjectScoreCategory }]

        FloatMap = Braintrust::HashOf[Float]

        StringArray = Braintrust::ArrayOf[String]

        # For categorical-type project scores, the list of all categories
        variant Braintrust::Models::ProjectScoreUpdateParams::Categories::ProjectScoreCategoryArray

        # For weighted-type project scores, the weights of each score
        variant Braintrust::Models::ProjectScoreUpdateParams::Categories::FloatMap

        # For minimum-type project scores, the list of included scores
        variant Braintrust::Models::ProjectScoreUpdateParams::Categories::StringArray

        variant -> { Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant }

        class NullableVariant < Braintrust::BaseModel
          # @!parse
          #   def initialize(**) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end
      end

      # @abstract
      #
      # The type of the configured score
      class ScoreType < Braintrust::Enum
        SLIDER = :slider
        CATEGORICAL = :categorical
        WEIGHTED = :weighted
        MINIMUM = :minimum
        MAXIMUM = :maximum
        ONLINE = :online

        finalize!
      end
    end
  end
end
