# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#feedback
    class ExperimentFeedbackParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute feedback
      #   A list of experiment feedback items
      #
      #   @return [Array<Braintrust::Models::FeedbackExperimentItem>]
      required :feedback, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::FeedbackExperimentItem] }

      # @!method initialize(feedback:, request_options: {})
      #   @param feedback [Array<Braintrust::Models::FeedbackExperimentItem>]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
