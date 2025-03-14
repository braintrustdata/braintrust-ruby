# frozen_string_literal: true

module Braintrust
  module Models
    class AISecret < Braintrust::BaseModel
      # @!attribute id
      #   Unique identifier for the AI secret
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the AI secret
      #
      #   @return [String]
      required :name, String

      # @!attribute org_id
      #   Unique identifier for the organization
      #
      #   @return [String]
      required :org_id, String

      # @!attribute created
      #   Date of AI secret creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute preview_secret
      #
      #   @return [String, nil]
      optional :preview_secret, String, nil?: true

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!attribute updated_at
      #   Date of last AI secret update
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param name [String]
      #   # @param org_id [String]
      #   # @param created [Time, nil]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param preview_secret [String, nil]
      #   # @param type [String, nil]
      #   # @param updated_at [Time, nil]
      #   #
      #   def initialize(id:, name:, org_id:, created: nil, metadata: nil, preview_secret: nil, type: nil, updated_at: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
