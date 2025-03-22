# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVar < Braintrust::BaseModel
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

      # @!parse
      #   # @param id [String]
      #   # @param name [String]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::EnvVar::ObjectType]
      #   # @param created [Time, nil]
      #   # @param used [Time, nil]
      #   #
      #   def initialize(id:, name:, object_id_:, object_type:, created: nil, used: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # The type of the object the environment variable is scoped for
      module ObjectType
        extend Braintrust::Enum

        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
