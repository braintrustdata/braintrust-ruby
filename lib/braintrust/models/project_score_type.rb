# frozen_string_literal: true

module Braintrust
  module Models
    # @abstract
    #
    # The type of the configured score
    class ProjectScoreType < Braintrust::Enum
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
