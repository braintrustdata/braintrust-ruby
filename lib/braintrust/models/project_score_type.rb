# frozen_string_literal: true

module Braintrust
  module Models
    # The type of the configured score
    module ProjectScoreType
      extend Braintrust::Enum

      SLIDER = :slider
      CATEGORICAL = :categorical
      WEIGHTED = :weighted
      MINIMUM = :minimum
      MAXIMUM = :maximum
      ONLINE = :online
      FREE_FORM = :"free-form"

      finalize!
    end
  end
end
