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
      #   @return [Symbol]
      required :score_type, Braintrust::Enum.new(:slider, :categorical, :weighted, :minimum)

      # @!attribute [rw] user_id
      #   @return [String]
      required :user_id, String

      # @!attribute [rw] categories
      #   For categorical-type project scores, the list of all categories
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>|Array<String>|Braintrust::Models::ProjectScore::Categories::UnnamedTypeWithunionParent3|Hash]
      optional :categories, Braintrust::Unknown

      # @!attribute [rw] config
      #   @return [Braintrust::Models::ProjectScore::Config]
      optional :config, -> { Braintrust::Models::ProjectScore::Config }

      # @!attribute [rw] created
      #   Date of project score creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] description
      #   Textual description of the project score
      #   @return [String]
      optional :description, String

      # @!attribute [rw] position
      #   An optional LexoRank-based string that sets the sort position for the score in the UI
      #   @return [String]
      optional :position, String

      class Config < BaseModel
        # @!attribute [rw] destination
        #   @return [Symbol]
        optional :destination, Braintrust::Enum.new(:expected)

        # @!attribute [rw] multi_select
        #   @return [Boolean]
        optional :multi_select, Braintrust::BooleanModel
      end
    end
  end
end
