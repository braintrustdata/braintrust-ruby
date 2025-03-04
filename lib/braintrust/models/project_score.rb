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
      #   @return [Symbol, Braintrust::Models::ProjectScore::ScoreType]
      required :score_type, enum: -> { Braintrust::Models::ProjectScore::ScoreType }

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute [r] categories
      #   For categorical-type project scores, the list of all categories
      #
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScore::Categories::NullableVariant, nil]
      optional :categories, union: -> { Braintrust::Models::ProjectScore::Categories }

      # @!parse
      #   # @return [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScore::Categories::NullableVariant, nil]
      #   attr_writer :categories

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
      #   # @param score_type [Symbol, Braintrust::Models::ProjectScore::ScoreType]
      #   # @param user_id [String]
      #   # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScore::Categories::NullableVariant, nil]
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

      # @abstract
      #
      # The type of the configured score
      #
      # @example
      # ```ruby
      # case score_type
      # in :slider
      #   # ...
      # in :categorical
      #   # ...
      # in :weighted
      #   # ...
      # in :minimum
      #   # ...
      # in :maximum
      #   # ...
      # in ...
      #   #...
      # end
      # ```
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
      #
      # @example
      # ```ruby
      # case categories
      # in Braintrust::Models::ProjectScore::Categories::ProjectScoreCategoryArray
      #   # ...
      # in Braintrust::Models::ProjectScore::Categories::FloatMap
      #   # ...
      # in Braintrust::Models::ProjectScore::Categories::StringArray
      #   # ...
      # in Braintrust::Models::ProjectScore::Categories::NullableVariant
      #   # ...
      # end
      # ```
      class Categories < Braintrust::Union
        ProjectScoreCategoryArray = Braintrust::ArrayOf[-> { Braintrust::Models::ProjectScoreCategory }]

        FloatMap = Braintrust::HashOf[Float]

        StringArray = Braintrust::ArrayOf[String]

        # For categorical-type project scores, the list of all categories
        variant Braintrust::Models::ProjectScore::Categories::ProjectScoreCategoryArray

        # For weighted-type project scores, the weights of each score
        variant Braintrust::Models::ProjectScore::Categories::FloatMap

        # For minimum-type project scores, the list of included scores
        variant Braintrust::Models::ProjectScore::Categories::StringArray

        variant -> { Braintrust::Models::ProjectScore::Categories::NullableVariant }

        class NullableVariant < Braintrust::BaseModel
          # @!parse
          #   def initialize(**) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end
      end
    end
  end
end
