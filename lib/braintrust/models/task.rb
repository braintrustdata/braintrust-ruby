# frozen_string_literal: true

module Braintrust
  module Models
    class Task < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Braintrust::Models::Task::Type]
      required :type, enum: -> { Braintrust::Models::Task::Type }

      class Type < Braintrust::Enum
        TASK = :task
      end

      # @!parse
      #   # Create a new instance of Task from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
