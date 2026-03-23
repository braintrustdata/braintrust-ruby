# frozen_string_literal: true

module Braintrust
  module Models
    class ViewData < Braintrust::Internal::Type::BaseModel
      # @!attribute search
      #
      #   @return [Braintrust::Models::ViewDataSearch, nil]
      optional :search, -> { Braintrust::ViewDataSearch }, nil?: true

      # @!method initialize(search: nil)
      #   The view definition
      #
      #   @param search [Braintrust::Models::ViewDataSearch, nil]
    end
  end
end
