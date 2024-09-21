# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackResponseSchema < BaseModel
      # @!attribute [rw] status
      #   One of the constants defined in {Braintrust::Models::FeedbackResponseSchema::Status}
      #   @return [Symbol]
      required :status, enum: -> { Braintrust::Models::FeedbackResponseSchema::Status }

      class Status < Braintrust::Enum
        SUCCESS = :success
      end
    end
  end
end
