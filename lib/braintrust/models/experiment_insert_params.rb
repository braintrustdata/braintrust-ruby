# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#insert
    class ExperimentInsertParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute events
      #   A list of experiment events to insert
      #
      #   @return [Array<Braintrust::Models::InsertExperimentEvent>]
      required :events, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::InsertExperimentEvent] }

      # @!method initialize(events:, request_options: {})
      #   @param events [Array<Braintrust::Models::InsertExperimentEvent>]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
