# frozen_string_literal: true

module Braintrust
  module Models
    # The type of the configured score
    class ProjectScoreType < Braintrust::Enum
      SLIDER = :slider
      CATEGORICAL = :categorical
      WEIGHTED = :weighted
      MINIMUM = :minimum
      ONLINE = :online
    end
  end
end
