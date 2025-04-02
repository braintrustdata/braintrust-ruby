# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::EnvVars#replace
    class EnvVarReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      #   @return [Symbol, Braintrust::Models::EnvVarReplaceParams::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::EnvVarReplaceParams::ObjectType }

      # @!attribute value
      #   The value of the environment variable. Will be encrypted at rest.
      #
      #   @return [String, nil]
      optional :value, String, nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::EnvVarReplaceParams::ObjectType]
      #   # @param value [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, object_id_:, object_type:, value: nil, request_options: {}, **) = super

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
