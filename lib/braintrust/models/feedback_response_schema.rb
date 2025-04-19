# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Braintrust::Models::FeedbackResponseSchema::Status]
      required :status, enum: -> { Braintrust::Models::FeedbackResponseSchema::Status }

      # @!method initialize(status:)
      #   @param status [Symbol, Braintrust::Models::FeedbackResponseSchema::Status]

      # @see Braintrust::Models::FeedbackResponseSchema#status
      module Status
        extend Braintrust::Internal::Type::Enum

        SUCCESS = :success

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
