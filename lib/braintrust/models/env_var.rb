# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVar < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the environment variable
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   The name of the environment variable
      #
      #   @return [String]
      required :name, String

      # @!attribute object_id_
      #   The id of the object the environment variable is scoped for
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The type of the object the environment variable is scoped for
      #
      #   @return [Symbol, Braintrust::Models::EnvVar::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::EnvVar::ObjectType }

      # @!attribute created
      #   Date of environment variable creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute used
      #   Date the environment variable was last used
      #
      #   @return [Time, nil]
      optional :used, Time, nil?: true

      # @!method initialize(id:, name:, object_id_:, object_type:, created: nil, used: nil)
      #   @param id [String] Unique identifier for the environment variable
      #
      #   @param name [String] The name of the environment variable
      #
      #   @param object_id_ [String] The id of the object the environment variable is scoped for
      #
      #   @param object_type [Symbol, Braintrust::Models::EnvVar::ObjectType] The type of the object the environment variable is scoped for
      #
      #   @param created [Time, nil] Date of environment variable creation
      #
      #   @param used [Time, nil] Date the environment variable was last used

      # The type of the object the environment variable is scoped for
      #
      # @see Braintrust::Models::EnvVar#object_type
      module ObjectType
        extend Braintrust::Internal::Type::Enum

        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
