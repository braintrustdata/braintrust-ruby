# frozen_string_literal: true

module Braintrust
  module Models
    class InsertEventsResponse < BaseModel
      # @!attribute [rw] row_ids
      #   The ids of all rows that were inserted, aligning one-to-one with the rows provided as input
      #   @return [Array<String>]
      required :row_ids, Braintrust::ArrayOf.new(String)

      # @!parse
      #   # Create a new instance of InsertEventsResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<String>] :row_ids The ids of all rows that were inserted, aligning one-to-one with the rows
      #   #     provided as input
      #   def initialize(data = {}) = super
    end
  end
end
