# frozen_string_literal: true

module Braintrust
  module Models
    class ExperimentInsertResponse < BaseModel
          # @!attribute [rw] row_ids
          #   The ids of all rows that were inserted, aligning one-to-one with the rows provided as input
          #   @return [Array<String>]
          required :row_ids, Braintrust::ArrayOf.new(String)
    end
  end
end
