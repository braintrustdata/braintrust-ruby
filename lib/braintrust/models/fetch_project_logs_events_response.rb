# frozen_string_literal: true

module Braintrust
  module Models
    class FetchProjectLogsEventsResponse < Braintrust::Internal::Type::BaseModel
      # @!attribute events
      #   A list of fetched events
      #
      #   @return [Array<Braintrust::ProjectLogsEvent>]
      required :events, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::ProjectLogsEvent] }

      # @!attribute cursor
      #   Pagination cursor
      #
      #   Pass this string directly as the `cursor` param to your next fetch request to
      #   get the next page of results. Not provided if the returned result set is empty.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!method initialize(events:, cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::FetchProjectLogsEventsResponse} for more details.
      #
      #   @param events [Array<Braintrust::ProjectLogsEvent>] A list of fetched events
      #
      #   @param cursor [String, nil] Pagination cursor
    end
  end
end
