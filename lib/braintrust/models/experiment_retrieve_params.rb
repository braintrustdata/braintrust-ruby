# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#retrieve
    class ExperimentRetrieveParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
