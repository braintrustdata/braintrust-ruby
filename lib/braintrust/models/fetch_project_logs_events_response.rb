# frozen_string_literal: true

module Braintrust
  module Models
    class FetchProjectLogsEventsResponse < BaseModel
      # @!attribute [rw] events
      #   A list of fetched events
      #   @return [Array<Braintrust::Models::ProjectLogsEvent>]
      required :events, Braintrust::ArrayOf.new(-> { Braintrust::Models::ProjectLogsEvent })

      # @!attribute [rw] cursor
      #   Pagination cursor
      #
      # Pass this string directly as the `cursor` param to your next fetch request to get the next page of results. Not provided if the returned result set is empty.
      #   @return [String]
      optional :cursor, String

      # @!parse
      #   # Create a new instance of FetchProjectLogsEventsResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<Object>] :events A list of fetched events
      #   #   @option data [String, nil] :cursor Pagination cursor
      #   #
      #   #     Pass this string directly as the `cursor` param to your next fetch request to
      #   #     get the next page of results. Not provided if the returned result set is empty.
      #   def initialize(data = {}) = super
    end
  end
end
