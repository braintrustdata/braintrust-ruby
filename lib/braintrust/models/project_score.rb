# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScore < Braintrust::BaseModel
      # @!attribute id
      #   Unique identifier for the project score
      #
      #   @return [String]
      required :id, String

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

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      optional :categories, union: -> { Braintrust::Models::ProjectScore::Categories }, nil?: true

      # @!attribute config
      #
      #   @return [Braintrust::Models::ProjectScoreConfig, nil]
      optional :config, -> { Braintrust::Models::ProjectScoreConfig }, nil?: true

      # @!attribute created
      #   Date of project score creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute description
      #   Textual description of the project score
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute position
      #   An optional LexoRank-based string that sets the sort position for the score in
      #     the UI
      #
      #   @return [String, nil]
      optional :position, String, nil?: true

      # @!parse
      #   # A project score is a user-configured score, which can be manually-labeled
      #   #   through the UI
      #   #
      #   # @param id [String]
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param score_type [Symbol, Braintrust::Models::ProjectScoreType]
      #   # @param user_id [String]
      #   # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      #   # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #   # @param created [Time, nil]
      #   # @param description [String, nil]
      #   # @param position [String, nil]
      #   #
      #   def initialize(
      #     id:,
      #     name:,
      #     project_id:,
      #     score_type:,
      #     user_id:,
      #     categories: nil,
      #     config: nil,
      #     created: nil,
      #     description: nil,
      #     position: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # For categorical-type project scores, the list of all categories
      module Categories
        extend Braintrust::Union

        # For categorical-type project scores, the list of all categories
        variant -> { Braintrust::Models::ProjectScore::Categories::ProjectScoreCategoryArray }

        # For weighted-type project scores, the weights of each score
        variant -> { Braintrust::Models::ProjectScore::Categories::FloatMap }

        # For minimum-type project scores, the list of included scores
        variant -> { Braintrust::Models::ProjectScore::Categories::StringArray }

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
