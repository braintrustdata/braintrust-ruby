# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectTag < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the project tag
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the project tag
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the project tag belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] user_id
      #   @return [String]
      required :user_id, String

      # @!attribute [rw] color
      #   Color of the tag for the UI
      #   @return [String]
      optional :color, String

      # @!attribute [rw] created
      #   Date of project tag creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] description
      #   Textual description of the project tag
      #   @return [String]
      optional :description, String

      # @!parse
      #   # Create a new instance of ProjectTag from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the project tag
      #   #   @option data [String] :name Name of the project tag
      #   #   @option data [String] :project_id Unique identifier for the project that the project tag belongs under
      #   #   @option data [String] :user_id
      #   #   @option data [String, nil] :color Color of the tag for the UI
      #   #   @option data [String, nil] :created Date of project tag creation
      #   #   @option data [String, nil] :description Textual description of the project tag
      #   def initialize(data = {}) = super
    end
  end
end
