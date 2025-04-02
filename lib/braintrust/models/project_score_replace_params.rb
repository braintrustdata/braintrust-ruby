# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectScores#replace
    class ProjectScoreReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
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
      #   @return [Symbol, Braintrust::Models::ProjectScoreType]
      required :score_type, enum: -> { Braintrust::Models::ProjectScoreType }

      # @!attribute categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      optional :categories, union: -> { Braintrust::Models::ProjectScoreReplaceParams::Categories }, nil?: true

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
      #   # @param score_type [Symbol, Braintrust::Models::ProjectScoreType]
      #   # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      #   # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #   # @param description [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Union

        # For categorical-type project scores, the list of all categories
        variant -> { Braintrust::Models::ProjectScoreReplaceParams::Categories::ProjectScoreCategoryArray }

        # For weighted-type project scores, the weights of each score
        variant -> { Braintrust::Models::ProjectScoreReplaceParams::Categories::FloatMap }

        # For minimum-type project scores, the list of included scores
        variant -> { Braintrust::Models::ProjectScoreReplaceParams::Categories::StringArray }

        # @!parse
        #   # @return [Array(Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>)]
        #   def self.variants; end

        ProjectScoreCategoryArray = Braintrust::ArrayOf[-> { Braintrust::Models::ProjectScoreCategory }]

        FloatMap = Braintrust::HashOf[Float]

        StringArray = Braintrust::ArrayOf[String]
      end
    end
  end
end
