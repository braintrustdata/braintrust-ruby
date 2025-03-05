# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVarUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      # @!parse
      #   # @param name [String]
      #   # @param value [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, value: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
