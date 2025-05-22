# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#feedback
    class DatasetFeedbackParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute feedback
      #   A list of dataset feedback items
      #
      #   @return [Array<Braintrust::Models::FeedbackDatasetItem>]
      required :feedback, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::FeedbackDatasetItem] }

      # @!method initialize(feedback:, request_options: {})
      #   @param feedback [Array<Braintrust::Models::FeedbackDatasetItem>] A list of dataset feedback items
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
