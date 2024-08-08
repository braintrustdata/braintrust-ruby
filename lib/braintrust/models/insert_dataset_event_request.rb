# frozen_string_literal: true

module Braintrust
  module Models
    class InsertDatasetEventRequest < BaseModel
      # @!attribute [rw] events
      #   A list of dataset events to insert
      #   @return [Array<Braintrust::Models::InsertDatasetEventMerge|Braintrust::Models::InsertDatasetEventReplace>]
      required :events, Braintrust::ArrayOf.new(Braintrust::Unknown)
    end
  end
end
