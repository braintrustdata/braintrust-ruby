# frozen_string_literal: true

module Braintrust
  module Models
    class LogInsertResponse < Braintrust::Models::InsertEventsResponse
      # @!attribute [rw] serialized_span_slugs
      #   String slugs which line up 1-1 with the row_ids. These slugs can be used as the 'parent' specifier to attach spans underneath the row
      #   @return [Array<String>]
      required :serialized_span_slugs, Braintrust::ArrayOf.new(String)
    end
  end
end
