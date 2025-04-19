# frozen_string_literal: true

module Braintrust
  module Models
    class FetchExperimentEventsResponse < Braintrust::Internal::Type::BaseModel
      # @!attribute events
      #   A list of fetched events
      #
      #   @return [Array<Braintrust::Models::ExperimentEvent>]
      required :events, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::ExperimentEvent] }

      # @!attribute cursor
      #   Pagination cursor
      #
      #   Pass this string directly as the `cursor` param to your next fetch request to
      #   get the next page of results. Not provided if the returned result set is empty.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!method initialize(events:, cursor: nil)
      #   @param events [Array<Braintrust::Models::ExperimentEvent>]
      #   @param cursor [String, nil]
    end
  end
end
