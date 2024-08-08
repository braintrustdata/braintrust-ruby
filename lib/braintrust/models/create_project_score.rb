# frozen_string_literal: true

module Braintrust
  module Models
    class CreateProjectScore < BaseModel
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

      # @!attribute [rw] categories
      #   For categorical-type project scores, the list of all categories
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>|Array<String>|Braintrust::Models::CreateProjectScore::Categories::UnnamedTypeWithunionParent3|Hash]
      optional :categories, Braintrust::Unknown

      # @!attribute [rw] description
      #   Textual description of the project score
      #   @return [String]
      optional :description, String
    end
  end
end
