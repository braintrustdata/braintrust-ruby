# frozen_string_literal: true

module Braintrust
  module Models
    class InsertProjectLogsEventRequest < BaseModel
      # @!attribute [rw] events
      #   A list of project logs events to insert
      #   @return [Array<Braintrust::Models::InsertProjectLogsEventMerge|Braintrust::Models::InsertProjectLogsEventReplace>]
      required :events, Braintrust::ArrayOf.new(Braintrust::Unknown)
    end
  end
end
