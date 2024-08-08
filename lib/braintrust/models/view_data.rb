# frozen_string_literal: true

module Braintrust
  module Models
    class ViewData < BaseModel
      # @!attribute [rw] search
      #   @return [Braintrust::Models::ViewDataSearch]
      optional :search, -> { Braintrust::Models::ViewDataSearch }
    end
  end
end
