# typed: strong

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    class EnvVarObjectType < Braintrust::Enum
      abstract!

      ORGANIZATION = :organization
      PROJECT = :project
      FUNCTION = :function

      class << self
        sig { override.returns(T::Array[Symbol]) }
        def values
        end
      end
    end
  end
end
