# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Braintrust::FeedbackResponseSchema::Status]
      required :status, enum: -> { Braintrust::FeedbackResponseSchema::Status }

      # @!method initialize(status:)
      #   @param status [Symbol, Braintrust::FeedbackResponseSchema::Status]

      # @see Braintrust::FeedbackResponseSchema#status
      module Status
        extend Braintrust::Internal::Type::Enum

        SUCCESS = :success

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
