# frozen_string_literal: true

module Braintrust
  module Models
    class FunctionToolChoice < BaseModel
      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String
    end
  end
end
