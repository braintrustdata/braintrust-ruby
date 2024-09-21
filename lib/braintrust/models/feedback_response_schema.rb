# frozen_string_literal: true

module Braintrust
  module Models
    class FeedbackResponseSchema < BaseModel
      # @!attribute [rw] status
      #   @return [Symbol]
      required :status, Braintrust::Enum.new(:success)
    end
  end
end
