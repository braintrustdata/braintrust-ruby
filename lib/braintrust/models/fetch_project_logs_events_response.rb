# frozen_string_literal: true

module Braintrust
  module Models
    class FetchProjectLogsEventsResponse < Braintrust::BaseModel
      # @!attribute events
      #   A list of fetched events
      #
      #   @return [Array<Braintrust::Models::ProjectLogsEvent>]
      required :events, -> { Braintrust::ArrayOf[Braintrust::Models::ProjectLogsEvent] }

      # @!attribute cursor
      #   Pagination cursor
      #
      #     Pass this string directly as the `cursor` param to your next fetch request to
      #     get the next page of results. Not provided if the returned result set is empty.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!parse
      #   # @param events [Array<Braintrust::Models::ProjectLogsEvent>]
      #   # @param cursor [String, nil]
      #   #
      #   def initialize(events:, cursor: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
