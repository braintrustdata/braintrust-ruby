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
      required :name_, String, api_name: :name

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the project score belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] score_type
      #   The type of the configured score
      #   @return [Symbol, Braintrust::Models::ProjectScoreType]
      required :score_type, enum: -> { Braintrust::Models::ProjectScoreType }

      # @!attribute [rw] user_id
      #   @return [String]
      required :user_id, String

      # @!attribute [rw] categories
      #   For categorical-type project scores, the list of all categories
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>, Array<String>, Braintrust::Models::ProjectScore::Categories::UnnamedTypeWithunionParent7, Hash]
      optional :categories, Braintrust::Unknown

      # @!attribute [rw] config
      #   @return [Braintrust::Models::ProjectScoreConfig]
      optional :config, -> { Braintrust::Models::ProjectScoreConfig }

      # @!attribute [rw] created
      #   Date of project score creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] description
      #   Textual description of the project score
      #   @return [String]
      optional :description, String

      # @!attribute [rw] position
      #   An optional LexoRank-based string that sets the sort position for the score in the UI
      #   @return [String]
      optional :position, String

      # @!parse
      #   # Create a new instance of ProjectScore from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the project score
      #   #   @option data [String] :name Name of the project score
      #   #   @option data [String] :project_id Unique identifier for the project that the project score belongs under
      #   #   @option data [String] :score_type The type of the configured score
      #   #   @option data [String] :user_id
      #   #   @option data [Array<Object>, Array<String>, Hash, Object, nil] :categories For categorical-type project scores, the list of all categories
      #   #   @option data [Object, nil] :config
      #   #   @option data [String, nil] :created Date of project score creation
      #   #   @option data [String, nil] :description Textual description of the project score
      #   #   @option data [String, nil] :position An optional LexoRank-based string that sets the sort position for the score in
      #   #     the UI
      #   def initialize(data = {}) = super
    end
  end
end
