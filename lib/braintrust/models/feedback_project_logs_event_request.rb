# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackProjectLogsEventRequest < BaseModel
      # @!attribute [rw] feedback
      #   A list of project logs feedback items
      #   @return [Array<Braintrust::Models::FeedbackProjectLogsItem>]
      required :feedback, Braintrust::ArrayOf.new(-> { Braintrust::Models::FeedbackProjectLogsItem })
    end
  end
end
