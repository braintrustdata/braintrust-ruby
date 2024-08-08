# frozen_string_literal: true

module Braintrust
  module Models
    class InsertExperimentEventRequest < BaseModel
      # @!attribute [rw] events
      #   A list of experiment events to insert
      #   @return [Array<Braintrust::Models::InsertExperimentEventMerge|Braintrust::Models::InsertExperimentEventReplace>]
      required :events, Braintrust::ArrayOf.new(Braintrust::Unknown)
    end
  end
end
