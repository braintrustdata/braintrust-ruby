# frozen_string_literal: true

module Braintrust
  module Models
    # The type of the configured score
    module ProjectScoreType
      extend Braintrust::Internal::Type::Enum

      SLIDER = :slider
      CATEGORICAL = :categorical
      WEIGHTED = :weighted
      MINIMUM = :minimum
      MAXIMUM = :maximum
      ONLINE = :online
      FREE_FORM = :"free-form"

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
