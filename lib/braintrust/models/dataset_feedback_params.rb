# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#feedback
    class DatasetFeedbackParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute feedback
      #   A list of dataset feedback items
      #
      #   @return [Array<Braintrust::Models::FeedbackDatasetItem>]
      required :feedback, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::FeedbackDatasetItem] }

      # @!parse
      #   # @param feedback [Array<Braintrust::Models::FeedbackDatasetItem>]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(feedback:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
