# frozen_string_literal: true

module Braintrust
  module Models
    class DatasetSummarizeParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute summarize_data
      #   Whether to summarize the data. If false (or omitted), only the metadata will be
      #     returned.
      #
      #   @return [Boolean, nil]
      optional :summarize_data, Braintrust::BooleanModel, nil?: true

      # @!parse
      #   # @param summarize_data [Boolean, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(summarize_data: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
