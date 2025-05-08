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
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::InsertEventsResponse} for more details.
      #
      #   @param row_ids [Array<String>] The ids of all rows that were inserted, aligning one-to-one with the rows provid
    end
  end
end
