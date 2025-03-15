# typed: strong

module Braintrust
  module Models
    # The type of the configured score
    class ProjectScoreType < Braintrust::Enum
      abstract!

      SLIDER = :slider
      CATEGORICAL = :categorical
      WEIGHTED = :weighted
      MINIMUM = :minimum
      MAXIMUM = :maximum
      ONLINE = :online
      FREE_FORM = :"free-form"

      class << self
        sig { override.returns(T::Array[Symbol]) }
        def values
        end
      end
    end
  end
end
