# frozen_string_literal: true

module Braintrust
  module Models
    class InsertEventsResponse < Braintrust::Internal::Type::BaseModel
      # @!attribute row_ids
      #   The ids of all rows that were inserted, aligning one-to-one with the rows
      #   provided as input
      #
      #   @return [Array<String>]
      required :row_ids, Braintrust::Internal::Type::ArrayOf[String]

      # @!method initialize(row_ids:)
      #   @param row_ids [Array<String>]
    end
  end
end
