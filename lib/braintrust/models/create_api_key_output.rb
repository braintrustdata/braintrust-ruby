# frozen_string_literal: true

module Braintrust
  module Models
    class CreateAPIKeyOutput < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the api key
      #   @return [String]
      required :id, String

      # @!attribute [rw] key
      #   The raw API key. It will only be exposed this one time
      #   @return [String]
      required :key, String

      # @!attribute [rw] name_
      #   Name of the api key
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] preview_name
      #   @return [String]
      required :preview_name, String

      # @!attribute [rw] created
      #   Date of api key creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] org_id
      #   Unique identifier for the organization
      #   @return [String]
      optional :org_id, String

      # @!attribute [rw] user_id
      #   Unique identifier for the user
      #   @return [String]
      optional :user_id, String

      # @!parse
      #   # Create a new instance of CreateAPIKeyOutput from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the api key
      #   #   @option data [String] :key The raw API key. It will only be exposed this one time
      #   #   @option data [String] :name Name of the api key
      #   #   @option data [String] :preview_name
      #   #   @option data [String, nil] :created Date of api key creation
      #   #   @option data [String, nil] :org_id Unique identifier for the organization
      #   #   @option data [String, nil] :user_id Unique identifier for the user
      #   def initialize(data = {}) = super
    end
  end
end
