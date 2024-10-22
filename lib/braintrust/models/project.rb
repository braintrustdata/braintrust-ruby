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
      required :name_, String, api_name: :name

      # @!attribute [rw] org_id
      #   Unique id for the organization that the project belongs under
      #   @return [String]
      required :org_id, String

      # @!attribute [rw] created
      #   Date of project creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] deleted_at
      #   Date of project deletion, or null if the project is still active
      #   @return [Time]
      optional :deleted_at, Time

      # @!attribute [rw] settings
      #   @return [Braintrust::Models::ProjectSettings]
      optional :settings, -> { Braintrust::Models::ProjectSettings }

      # @!attribute [rw] user_id
      #   Identifies the user who created the project
      #   @return [String]
      optional :user_id, String

      # @!parse
      #   # Create a new instance of Project from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the project
      #   #   @option data [String] :name Name of the project
      #   #   @option data [String] :org_id Unique id for the organization that the project belongs under
      #   #   @option data [String, nil] :created Date of project creation
      #   #   @option data [String, nil] :deleted_at Date of project deletion, or null if the project is still active
      #   #   @option data [Object, nil] :settings
      #   #   @option data [String, nil] :user_id Identifies the user who created the project
      #   def initialize(data = {}) = super
    end
  end
end
