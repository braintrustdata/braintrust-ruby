# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Braintrust::Models::FeedbackResponseSchema::Status]
      required :status, enum: -> { Braintrust::Models::FeedbackResponseSchema::Status }

      # @!parse
      #   # @param status [Symbol, Braintrust::Models::FeedbackResponseSchema::Status]
      #   #
      #   def initialize(status:, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @see Braintrust::Models::FeedbackResponseSchema#status
      module Status
        extend Braintrust::Enum

        SUCCESS = :success

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
