# typed: strong

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    class EnvVarObjectType < Braintrust::Enum
      abstract!

      Value = type_template(:out) { {fixed: Symbol} }

      ORGANIZATION = :organization
      PROJECT = :project
      FUNCTION = :function
    end
  end
end
