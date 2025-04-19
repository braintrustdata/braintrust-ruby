# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::EnvVars#update
    class EnvVarUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   The name of the environment variable
      #
      #   @return [String]
      required :name, String

      # @!attribute value
      #   The value of the environment variable. Will be encrypted at rest.
      #
      #   @return [String, nil]
      optional :value, String, nil?: true

      # @!method initialize(name:, value: nil, request_options: {})
      #   @param name [String]
      #   @param value [String, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
