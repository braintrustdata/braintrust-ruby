# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::EnvVars#list
    class EnvVarListResponse < Braintrust::BaseModel
      # @!attribute objects
      #   A list of env_var objects
      #
      #   @return [Array<Braintrust::Models::EnvVar>]
      required :objects, -> { Braintrust::ArrayOf[Braintrust::Models::EnvVar] }

      # @!parse
      #   # @param objects [Array<Braintrust::Models::EnvVar>]
      #   #
      #   def initialize(objects:, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
