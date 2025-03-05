# frozen_string_literal: true

module Braintrust
  module Models
    class ViewData < Braintrust::BaseModel
      # @!attribute search
      #
      #   @return [Braintrust::Models::ViewDataSearch, nil]
      optional :search, -> { Braintrust::Models::ViewDataSearch }, nil?: true

      # @!parse
      #   # The view definition
      #   #
      #   # @param search [Braintrust::Models::ViewDataSearch, nil]
      #   #
      #   def initialize(search: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
