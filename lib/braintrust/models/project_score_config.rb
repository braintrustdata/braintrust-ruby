# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreConfig < Braintrust::Internal::Type::BaseModel
      # @!attribute destination
      #
      #   @return [String, nil]
      optional :destination, String, nil?: true

      # @!attribute multi_select
      #
      #   @return [Boolean, nil]
      optional :multi_select, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute online
      #
      #   @return [Braintrust::Models::OnlineScoreConfig, nil]
      optional :online, -> { Braintrust::Models::OnlineScoreConfig }, nil?: true

      # @!method initialize(destination: nil, multi_select: nil, online: nil)
      #   @param destination [String, nil]
      #   @param multi_select [Boolean, nil]
      #   @param online [Braintrust::Models::OnlineScoreConfig, nil]
    end
  end
end
