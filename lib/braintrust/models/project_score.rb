# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScore < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the project score
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the project score
      #   @return [String]
      required :name_, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the project score belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] score_type
      #   The type of the configured score
      #   One of the constants defined in {Braintrust::Models::ProjectScore::ScoreType}
      #   @return [Symbol]
      required :score_type, enum: -> { Braintrust::Models::ProjectScore::ScoreType }

      # @!attribute [rw] user_id
      #   @return [String]
      required :user_id, String

      # @!attribute [rw] categories
      #   For categorical-type project scores, the list of all categories
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>|Array<String>|Braintrust::Models::ProjectScore::Categories::UnnamedTypeWithunionParent6|Hash]
      optional :categories, Braintrust::Unknown

      # @!attribute [rw] config
      #   @return [Braintrust::Models::ProjectScore::Config]
      optional :config, -> { Braintrust::Models::ProjectScore::Config }

      # @!attribute [rw] created
      #   Date of project score creation
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] description
      #   Textual description of the project score
      #   @return [String]
      optional :description, String

      # @!attribute [rw] position
      #   An optional LexoRank-based string that sets the sort position for the score in the UI
      #   @return [String]
      optional :position, String

      # The type of the configured score
      class ScoreType < Braintrust::Enum
        SLIDER = :slider
        CATEGORICAL = :categorical
        WEIGHTED = :weighted
        MINIMUM = :minimum
        ONLINE = :online
      end

      class Config < BaseModel
        # @!attribute [rw] destination
        #   One of the constants defined in {Braintrust::Models::ProjectScore::Config::Destination}
        #   @return [Symbol]
        optional :destination, enum: -> { Braintrust::Models::ProjectScore::Config::Destination }

        # @!attribute [rw] multi_select
        #   @return [Boolean]
        optional :multi_select, Braintrust::BooleanModel

        # @!attribute [rw] online
        #   @return [Braintrust::Models::ProjectScore::Config::Online]
        optional :online, -> { Braintrust::Models::ProjectScore::Config::Online }

        class Destination < Braintrust::Enum
          EXPECTED = :expected
        end

        class Online < BaseModel
          # @!attribute [rw] sampling_rate
          #   The sampling rate for online scoring
          #   @return [Float]
          required :sampling_rate, Float

          # @!attribute [rw] scorers
          #   The list of scorers to use for online scoring
          #   @return [Array<Braintrust::Models::ProjectScore::Config::Online::Scorer::UnnamedTypeWithunionParent4|Braintrust::Models::ProjectScore::Config::Online::Scorer::UnnamedTypeWithunionParent5>]
          required :scorers, Braintrust::ArrayOf.new(Braintrust::Unknown)

          # @!attribute [rw] apply_to_root_span
          #   Whether to trigger online scoring on the root span of each trace
          #   @return [Boolean]
          optional :apply_to_root_span, Braintrust::BooleanModel

          # @!attribute [rw] apply_to_span_names
          #   Trigger online scoring on any spans with a name in this list
          #   @return [Array<String>]
          optional :apply_to_span_names, Braintrust::ArrayOf.new(String)
        end
      end
    end
  end
end
