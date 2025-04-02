# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::EnvVars#list
    class EnvVarListParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
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
      #   @return [Symbol, Braintrust::Models::EnvVarObjectType, nil]
      optional :object_type, enum: -> { Braintrust::Models::EnvVarObjectType }

      # @!parse
      #   # @return [Symbol, Braintrust::Models::EnvVarObjectType]
      #   attr_writer :object_type

      # @!parse
      #   # @param env_var_name [String]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::EnvVarObjectType]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(env_var_name: nil, ids: nil, limit: nil, object_id_: nil, object_type: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      module IDs
        extend Braintrust::Union

        variant String

        variant -> { Braintrust::Models::EnvVarListParams::IDs::StringArray }

        # @!parse
        #   # @return [Array(String, Array<String>)]
        #   def self.variants; end

        StringArray = Braintrust::ArrayOf[String]
      end
    end
  end
end
