# frozen_string_literal: true

module Braintrust
  module Models
    class Scorer < BaseModel
      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   One of the constants defined in {Braintrust::Models::Scorer::Type}
      #   @return [Symbol]
      required :type, enum: -> { Braintrust::Models::Scorer::Type }

      class Type < Braintrust::Enum
        SCORER = :scorer
      end
    end
  end
end
