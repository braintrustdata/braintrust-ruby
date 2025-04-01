# frozen_string_literal: true

module Braintrust
  module Models
    class DatasetFeedbackParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute feedback
      #   A list of dataset feedback items
      #
      #   @return [Array<Braintrust::Models::FeedbackDatasetItem>]
      required :feedback, -> { Braintrust::ArrayOf[Braintrust::Models::FeedbackDatasetItem] }

      # @!parse
      #   # @param feedback [Array<Braintrust::Models::FeedbackDatasetItem>]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(feedback:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
