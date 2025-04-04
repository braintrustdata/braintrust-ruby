# frozen_string_literal: true

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    module EnvVarObjectType
      extend Braintrust::Internal::Type::Enum

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
