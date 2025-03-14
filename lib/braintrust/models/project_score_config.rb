# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreConfig < Braintrust::BaseModel
      # @!attribute destination
      #
      #   @return [String, nil]
      optional :destination, String, nil?: true

      # @!attribute multi_select
      #
      #   @return [Boolean, nil]
      optional :multi_select, Braintrust::BooleanModel, nil?: true

      # @!attribute online
      #
      #   @return [Braintrust::Models::OnlineScoreConfig, nil]
      optional :online, -> { Braintrust::Models::OnlineScoreConfig }, nil?: true

      # @!parse
      #   # @param destination [String, nil]
      #   # @param multi_select [Boolean, nil]
      #   # @param online [Braintrust::Models::OnlineScoreConfig, nil]
      #   #
      #   def initialize(destination: nil, multi_select: nil, online: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
