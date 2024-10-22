# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreConfig < BaseModel
      # @!attribute [rw] destination
      #   @return [Symbol, Braintrust::Models::ProjectScoreConfig::Destination]
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

      # @!parse
      #   # Create a new instance of ProjectScoreConfig from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String, nil] :destination
      #   #   @option data [Hash, nil] :multi_select
      #   #   @option data [Object, nil] :online
      #   def initialize(data = {}) = super
    end
  end
end
