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
      required :name_, String

      # @!attribute [rw] object_id_
      #   The id of the object the environment variable is scoped for
      #   @return [String]
      required :object_id_, String

      # @!attribute [rw] object_type
      #   The type of the object the environment variable is scoped for
      #   One of the constants defined in {Braintrust::Models::EnvVar::ObjectType}
      #   @return [Symbol]
      required :object_type, enum: -> { Braintrust::Models::EnvVar::ObjectType }

      # @!attribute [rw] created
      #   Date of environment variable creation
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] used
      #   Date the environment variable was last used
      #   @return [DateTime]
      optional :used, DateTime

      # The type of the object the environment variable is scoped for
      class ObjectType < Braintrust::Enum
        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function
      end
    end
  end
end
