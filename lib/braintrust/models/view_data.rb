# frozen_string_literal: true

module Braintrust
  module Models
    class ViewData < Braintrust::Internal::Type::BaseModel
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

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
