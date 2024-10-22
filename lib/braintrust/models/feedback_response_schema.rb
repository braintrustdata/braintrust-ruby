# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackResponseSchema < BaseModel
      # @!attribute [rw] status
      #   @return [Symbol, Braintrust::Models::FeedbackResponseSchema::Status]
      required :status, enum: -> { Braintrust::Models::FeedbackResponseSchema::Status }

      class Status < Braintrust::Enum
        SUCCESS = :success
      end

      # @!parse
      #   # Create a new instance of FeedbackResponseSchema from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :status
      #   def initialize(data = {}) = super
    end
  end
end
