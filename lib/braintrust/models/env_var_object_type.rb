# frozen_string_literal: true

module Braintrust
  module Models
    # @abstract
    #
    # The type of the object the environment variable is scoped for
    class EnvVarObjectType < Braintrust::Enum
      ORGANIZATION = :organization
      PROJECT = :project
      FUNCTION = :function

      finalize!
    end
  end
end
