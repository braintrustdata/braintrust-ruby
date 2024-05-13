# frozen_string_literal: true

module Ruby
  module Models
    class DatasetInsertResponse < BaseModel
      # @!attribute [rw] row_ids
      #   The ids of all rows that were inserted, aligning one-to-one with the rows provided as input
      #   @return [Array<String>]
      required :row_ids, Ruby::ArrayOf.new(String)
    end
  end
end
