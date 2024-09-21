# frozen_string_literal: true

module Braintrust
  module Models
    class FetchDatasetEventsResponse < BaseModel
      # @!attribute [rw] events
      #   A list of fetched events
      #   @return [Array<Braintrust::Models::DatasetEvent>]
      required :events, Braintrust::ArrayOf.new(-> { Braintrust::Models::DatasetEvent })

      # @!attribute [rw] cursor
      #   Pagination cursor
      # 
      # Pass this string directly as the `cursor` param to your next fetch request to get the next page of results. Not provided if the returned result set is empty.
      #   @return [String]
      optional :cursor, String
    end
  end
end
