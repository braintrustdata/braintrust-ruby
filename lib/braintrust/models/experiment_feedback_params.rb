# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#feedback
    class ExperimentFeedbackParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute feedback
      #   A list of experiment feedback items
      #
      #   @return [Array<Braintrust::Models::FeedbackExperimentItem>]
      required :feedback, -> { Braintrust::ArrayOf[Braintrust::Models::FeedbackExperimentItem] }

      # @!parse
      #   # @param feedback [Array<Braintrust::Models::FeedbackExperimentItem>]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(feedback:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
