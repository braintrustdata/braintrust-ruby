# frozen_string_literal: true

module Braintrust
  module Models
    class Project < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the project
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the project
      #   @return [String]
      required :name_, String

      # @!attribute [rw] org_id
      #   Unique id for the organization that the project belongs under
      #   @return [String]
      required :org_id, String

      # @!attribute [rw] created
      #   Date of project creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] deleted_at
      #   Date of project deletion, or null if the project is still active
      #   @return [String]
      optional :deleted_at, String

      # @!attribute [rw] user_id
      #   Identifies the user who created the project
      #   @return [String]
      optional :user_id, String
    end
  end
end
