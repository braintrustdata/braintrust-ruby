# frozen_string_literal: true

module Braintrust
  module Models
    class ViewData < Braintrust::Internal::Type::BaseModel
      # @!attribute search
      #
      #   @return [Braintrust::ViewDataSearch, nil]
      optional :search, -> { Braintrust::ViewDataSearch }, nil?: true

      # @!method initialize(search: nil)
      #   The view definition
      #
      #   @param search [Braintrust::ViewDataSearch, nil]
    end
  end
end
