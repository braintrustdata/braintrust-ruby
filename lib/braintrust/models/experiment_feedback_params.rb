# frozen_string_literal: true

module Braintrust
  module Models
    class ExperimentFeedbackParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
