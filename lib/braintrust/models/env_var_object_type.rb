# frozen_string_literal: true

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    module EnvVarObjectType
      extend Braintrust::Enum

      ORGANIZATION = :organization
      PROJECT = :project
      FUNCTION = :function

      finalize!
    end
  end
end
