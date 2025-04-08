# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#summarize
    class DatasetSummarizeParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute summarize_data
      #   Whether to summarize the data. If false (or omitted), only the metadata will be
      #     returned.
      #
      #   @return [Boolean, nil]
      optional :summarize_data, Braintrust::Internal::Type::Boolean, nil?: true

      # @!parse
      #   # @param summarize_data [Boolean, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(summarize_data: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
