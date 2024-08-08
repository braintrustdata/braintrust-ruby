# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackDatasetEventRequest < BaseModel
      # @!attribute [rw] feedback
      #   A list of dataset feedback items
      #   @return [Array<Braintrust::Models::FeedbackDatasetItem>]
      required :feedback, Braintrust::ArrayOf.new(-> { Braintrust::Models::FeedbackDatasetItem })
    end
  end
end
