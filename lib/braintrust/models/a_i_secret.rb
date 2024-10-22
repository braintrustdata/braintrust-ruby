# frozen_string_literal: true

module Braintrust
  module Models
    class AISecret < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the AI secret
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the AI secret
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] org_id
      #   Unique identifier for the organization
      #   @return [String]
      required :org_id, String

      # @!attribute [rw] created
      #   Date of AI secret creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] metadata
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] preview_secret
      #   @return [String]
      optional :preview_secret, String

      # @!attribute [rw] type
      #   @return [String]
      optional :type, String

      # @!parse
      #   # Create a new instance of AISecret from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the AI secret
      #   #   @option data [String] :name Name of the AI secret
      #   #   @option data [String] :org_id Unique identifier for the organization
      #   #   @option data [String, nil] :created Date of AI secret creation
      #   #   @option data [Hash, nil] :metadata
      #   #   @option data [String, nil] :preview_secret
      #   #   @option data [String, nil] :type
      #   def initialize(data = {}) = super
    end
  end
end
