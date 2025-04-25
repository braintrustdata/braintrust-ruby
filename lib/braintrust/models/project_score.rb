# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScore < Braintrust::Internal::Type::BaseModel
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
      #   the UI
      #
      #   @return [String, nil]
      optional :position, String, nil?: true

      # @!method initialize(id:, name:, project_id:, score_type:, user_id:, categories: nil, config: nil, created: nil, description: nil, position: nil)
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ProjectScore} for more details.
      #
      #   A project score is a user-configured score, which can be manually-labeled
      #   through the UI
      #
      #   @param id [String] Unique identifier for the project score
      #
      #   @param name [String] Name of the project score
      #
      #   @param project_id [String] Unique identifier for the project that the project score belongs under
      #
      #   @param score_type [Symbol, Braintrust::Models::ProjectScoreType] The type of the configured score
      #
      #   @param user_id [String]
      #
      #   @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil] For categorical-type project scores, the list of all categories
      #
      #   @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #
      #   @param created [Time, nil] Date of project score creation
      #
      #   @param description [String, nil] Textual description of the project score
      #
      #   @param position [String, nil] An optional LexoRank-based string that sets the sort position for the score in t
      #   ...

      # For categorical-type project scores, the list of all categories
      #
      # @see Braintrust::Models::ProjectScore#categories
      module Categories
        extend Braintrust::Internal::Type::Union

        # For categorical-type project scores, the list of all categories
        variant -> { Braintrust::Models::ProjectScore::Categories::ProjectScoreCategoryArray }

        # For weighted-type project scores, the weights of each score
        variant -> { Braintrust::Models::ProjectScore::Categories::FloatMap }

        # For minimum-type project scores, the list of included scores
        variant -> { Braintrust::Models::ProjectScore::Categories::StringArray }

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
