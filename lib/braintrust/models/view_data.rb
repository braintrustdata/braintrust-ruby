# frozen_string_literal: true

module Braintrust
  module Models
    class ViewData < BaseModel
      # @!attribute [rw] search
      #   @return [Braintrust::Models::ViewDataSearch]
      optional :search, -> { Braintrust::Models::ViewDataSearch }

      # @!parse
      #   # Create a new instance of ViewData from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object, nil] :search
      #   def initialize(data = {}) = super
    end
  end
end
