# frozen_string_literal: true

module Braintrust
  module Models
    class AISecret < Braintrust::Internal::Type::BaseModel
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
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

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

      # @!method initialize(id:, name:, org_id:, created: nil, metadata: nil, preview_secret: nil, type: nil, updated_at: nil)
      #   @param id [String] Unique identifier for the AI secret
      #
      #   @param name [String] Name of the AI secret
      #
      #   @param org_id [String] Unique identifier for the organization
      #
      #   @param created [Time, nil] Date of AI secret creation
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #
      #   @param preview_secret [String, nil]
      #
      #   @param type [String, nil]
      #
      #   @param updated_at [Time, nil] Date of last AI secret update
    end
  end
end
