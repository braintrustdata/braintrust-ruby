# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      #   @return [Symbol, Braintrust::Models::ProjectScoreReplaceParams::ScoreType]
      required :score_type, enum: -> { Braintrust::Models::ProjectScoreReplaceParams::ScoreType }

      # @!attribute [r] categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreReplaceParams::Categories::NullableVariant, nil]
      optional :categories, union: -> { Braintrust::Models::ProjectScoreReplaceParams::Categories }

      # @!parse
      #   # @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreReplaceParams::Categories::NullableVariant, nil]
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

      # @!parse
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param score_type [Symbol, Braintrust::Models::ProjectScoreReplaceParams::ScoreType]
      #   # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreReplaceParams::Categories::NullableVariant, nil]
      #   # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #   # @param description [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

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

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end

      # @abstract
      #
      # For categorical-type project scores, the list of all categories
      class Categories < Braintrust::Union
        ProjectScoreCategoryArray = Braintrust::ArrayOf[-> { Braintrust::Models::ProjectScoreCategory }]

        FloatMap = Braintrust::HashOf[Float]

        StringArray = Braintrust::ArrayOf[String]

        # For categorical-type project scores, the list of all categories
        variant Braintrust::Models::ProjectScoreReplaceParams::Categories::ProjectScoreCategoryArray

        # For weighted-type project scores, the weights of each score
        variant Braintrust::Models::ProjectScoreReplaceParams::Categories::FloatMap

        # For minimum-type project scores, the list of included scores
        variant Braintrust::Models::ProjectScoreReplaceParams::Categories::StringArray

        variant -> { Braintrust::Models::ProjectScoreReplaceParams::Categories::NullableVariant }

        class NullableVariant < Braintrust::BaseModel
          # @!parse
          #   def initialize(**) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end
      end
    end
  end
end
