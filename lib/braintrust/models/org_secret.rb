# frozen_string_literal: true

module Braintrust
  module Models
    class OrgSecret < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the org secret
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the org secret
      #   @return [String]
      required :name_, String

      # @!attribute [rw] org_id
      #   Unique identifier for the organization
      #   @return [String]
      required :org_id, String

      # @!attribute [rw] created
      #   Date of org secret creation
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] metadata
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] preview_secret
      #   @return [String]
      optional :preview_secret, String

      # @!attribute [rw] type
      #   @return [String]
      optional :type, String
    end
  end
end
