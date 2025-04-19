# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::EnvVars#list
    class EnvVarListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute env_var_name
      #   Name of the env_var to search for
      #
      #   @return [String, nil]
      optional :env_var_name, String

      # @!attribute ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::EnvVarListParams::IDs }

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute object_id_
      #   The id of the object the environment variable is scoped for
      #
      #   @return [String, nil]
      optional :object_id_, String

      # @!attribute object_type
      #   The type of the object the environment variable is scoped for
      #
      #   @return [Symbol, Braintrust::Models::EnvVarObjectType, nil]
      optional :object_type, enum: -> { Braintrust::Models::EnvVarObjectType }

      # @!method initialize(env_var_name: nil, ids: nil, limit: nil, object_id_: nil, object_type: nil, request_options: {})
      #   @param env_var_name [String]
      #   @param ids [String, Array<String>]
      #   @param limit [Integer, nil]
      #   @param object_id_ [String]
      #   @param object_type [Symbol, Braintrust::Models::EnvVarObjectType]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::Models::EnvVarListParams::IDs::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
