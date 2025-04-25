# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::EnvVars#list
    class EnvVarListResponse < Braintrust::Internal::Type::BaseModel
      # @!attribute objects
      #   A list of env_var objects
      #
      #   @return [Array<Braintrust::Models::EnvVar>]
      required :objects, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::EnvVar] }

      # @!method initialize(objects:)
      #   @param objects [Array<Braintrust::Models::EnvVar>] A list of env_var objects
    end
  end
end
