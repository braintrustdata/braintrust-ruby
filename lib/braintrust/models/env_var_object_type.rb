# frozen_string_literal: true

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    module EnvVarObjectType
      extend Braintrust::Internal::Type::Enum

      ORGANIZATION = :organization
      PROJECT = :project
      FUNCTION = :function

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
