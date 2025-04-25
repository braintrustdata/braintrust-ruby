# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#summarize
    class DatasetSummarizeParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute summarize_data
      #   Whether to summarize the data. If false (or omitted), only the metadata will be
      #   returned.
      #
      #   @return [Boolean, nil]
      optional :summarize_data, Braintrust::Internal::Type::Boolean, nil?: true

      # @!method initialize(summarize_data: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::DatasetSummarizeParams} for more details.
      #
      #   @param summarize_data [Boolean, nil] Whether to summarize the data. If false (or omitted), only the metadata will be
      #   ...
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
