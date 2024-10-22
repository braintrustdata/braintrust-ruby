# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVar < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the environment variable
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   The name of the environment variable
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] object_id_
      #   The id of the object the environment variable is scoped for
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute [rw] object_type
      #   The type of the object the environment variable is scoped for
      #   @return [Symbol, Braintrust::Models::EnvVar::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::EnvVar::ObjectType }

      # @!attribute [rw] created
      #   Date of environment variable creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] used
      #   Date the environment variable was last used
      #   @return [Time]
      optional :used, Time

      # The type of the object the environment variable is scoped for
      class ObjectType < Braintrust::Enum
        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function
      end

      # @!parse
      #   # Create a new instance of EnvVar from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the environment variable
      #   #   @option data [String] :name The name of the environment variable
      #   #   @option data [String] :object_id The id of the object the environment variable is scoped for
      #   #   @option data [String] :object_type The type of the object the environment variable is scoped for
      #   #   @option data [String, nil] :created Date of environment variable creation
      #   #   @option data [String, nil] :used Date the environment variable was last used
      #   def initialize(data = {}) = super
    end
  end
end
