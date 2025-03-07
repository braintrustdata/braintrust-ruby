# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreConfig < Braintrust::BaseModel
      # @!attribute destination
      #
      #   @return [Symbol, Braintrust::Models::ProjectScoreConfig::Destination, nil]
      optional :destination, enum: -> { Braintrust::Models::ProjectScoreConfig::Destination }, nil?: true

      # @!attribute multi_select
      #
      #   @return [Boolean, nil]
      optional :multi_select, Braintrust::BooleanModel, nil?: true

      # @!attribute online
      #
      #   @return [Braintrust::Models::OnlineScoreConfig, nil]
      optional :online, -> { Braintrust::Models::OnlineScoreConfig }, nil?: true

      # @!parse
      #   # @param destination [Symbol, Braintrust::Models::ProjectScoreConfig::Destination, nil]
      #   # @param multi_select [Boolean, nil]
      #   # @param online [Braintrust::Models::OnlineScoreConfig, nil]
      #   #
      #   def initialize(destination: nil, multi_select: nil, online: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      class Destination < Braintrust::Enum
        EXPECTED = :expected

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
