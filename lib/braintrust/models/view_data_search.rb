# frozen_string_literal: true

module Braintrust
  module Models
    class ViewDataSearch < BaseModel
      # @!attribute [rw] filter
      #   @return [Array<Object>]
      optional :filter, Braintrust::ArrayOf.new(Braintrust::Unknown)

      # @!attribute [rw] match
      #   @return [Array<Object>]
      optional :match, Braintrust::ArrayOf.new(Braintrust::Unknown)

      # @!attribute [rw] sort
      #   @return [Array<Object>]
      optional :sort, Braintrust::ArrayOf.new(Braintrust::Unknown)

      # @!attribute [rw] tag
      #   @return [Array<Object>]
      optional :tag, Braintrust::ArrayOf.new(Braintrust::Unknown)
    end
  end
end
