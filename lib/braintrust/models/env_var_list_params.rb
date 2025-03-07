# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVarListParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute [r] env_var_name
      #   Name of the env_var to search for
      #
      #   @return [String, nil]
      optional :env_var_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :env_var_name

      # @!attribute [r] ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::EnvVarListParams::IDs }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :ids

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute [r] object_id_
      #   The id of the object the environment variable is scoped for
      #
      #   @return [String, nil]
      optional :object_id_, String, api_name: :object_id

      # @!parse
      #   # @return [String]
      #   attr_writer :object_id_

      # @!attribute [r] object_type
      #   The type of the object the environment variable is scoped for
      #
      #   @return [Symbol, Braintrust::Models::EnvVarListParams::ObjectType, nil]
      optional :object_type, enum: -> { Braintrust::Models::EnvVarListParams::ObjectType }

      # @!parse
      #   # @return [Symbol, Braintrust::Models::EnvVarListParams::ObjectType]
      #   attr_writer :object_type

      # @!parse
      #   # @param env_var_name [String]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::EnvVarListParams::ObjectType]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(env_var_name: nil, ids: nil, limit: nil, object_id_: nil, object_type: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      class IDs < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::EnvVarListParams::IDs::StringArray
      end

      # @abstract
      #
      # The type of the object the environment variable is scoped for
      class ObjectType < Braintrust::Enum
        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
