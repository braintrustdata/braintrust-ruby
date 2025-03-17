# typed: strong

module Braintrust
  module Models
    # The type of the configured score
    class ProjectScoreType < Braintrust::Enum
      abstract!

      Value = type_template(:out) { {fixed: Symbol} }

      SLIDER = :slider
      CATEGORICAL = :categorical
      WEIGHTED = :weighted
      MINIMUM = :minimum
      MAXIMUM = :maximum
      ONLINE = :online
      FREE_FORM = :"free-form"
    end
  end
end
