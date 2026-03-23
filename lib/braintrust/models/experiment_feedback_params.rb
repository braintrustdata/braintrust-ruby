# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#feedback
    class ExperimentFeedbackParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute feedback
      #   A list of experiment feedback items
      #
      #   @return [Array<Braintrust::Models::FeedbackExperimentItem>]
      required :feedback, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::FeedbackExperimentItem] }

      # @!method initialize(feedback:, request_options: {})
      #   @param feedback [Array<Braintrust::Models::FeedbackExperimentItem>] A list of experiment feedback items
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
