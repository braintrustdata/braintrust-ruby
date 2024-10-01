# frozen_string_literal: true

module Braintrust
  module Models
    class Task < BaseModel
      # @!attribute [rw] type
      #   One of the constants defined in {Braintrust::Models::Task::Type}
      #   @return [Symbol]
      required :type, enum: -> { Braintrust::Models::Task::Type }

      class Type < Braintrust::Enum
        TASK = :task
      end
    end
  end
end
