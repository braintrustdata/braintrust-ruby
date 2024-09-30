# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreConfig < BaseModel
      # @!attribute [rw] destination
      #   One of the constants defined in {Braintrust::Models::ProjectScoreConfig::Destination}
      #   @return [Symbol]
      optional :destination, enum: -> { Braintrust::Models::ProjectScoreConfig::Destination }

      # @!attribute [rw] multi_select
      #   @return [Boolean]
      optional :multi_select, Braintrust::BooleanModel

      # @!attribute [rw] online
      #   @return [Braintrust::Models::OnlineScoreConfig]
      optional :online, -> { Braintrust::Models::OnlineScoreConfig }

      class Destination < Braintrust::Enum
        EXPECTED = :expected
      end
    end
  end
end
