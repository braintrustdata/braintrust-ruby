# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackExperimentEventRequest < BaseModel
      # @!attribute [rw] feedback
      #   A list of experiment feedback items
      #   @return [Array<Braintrust::Models::FeedbackExperimentItem>]
      required :feedback, Braintrust::ArrayOf.new(-> { Braintrust::Models::FeedbackExperimentItem })
    end
  end
end
