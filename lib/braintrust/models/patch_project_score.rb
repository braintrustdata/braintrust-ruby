# frozen_string_literal: true

module Braintrust
  module Models
    class PatchProjectScore < BaseModel
      # @!attribute [rw] categories
      #   For categorical-type project scores, the list of all categories
      #   @return [Array<Braintrust::Models::ProjectScoreCategory>|Array<String>|Braintrust::Models::PatchProjectScore::Categories::UnnamedTypeWithunionParent11|Hash]
      optional :categories, Braintrust::Unknown

      # @!attribute [rw] description
      #   Textual description of the project score
      #   @return [String]
      optional :description, String

      # @!attribute [rw] name_
      #   Name of the project score
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] score_type
      #   The type of the configured score
      #   @return [Symbol]
      optional :score_type, Braintrust::Enum.new(:slider, :categorical, :weighted, :minimum)
    end
  end
end
