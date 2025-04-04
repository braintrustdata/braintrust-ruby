# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#insert
    class ExperimentInsertParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute events
      #   A list of experiment events to insert
      #
      #   @return [Array<Braintrust::Models::InsertExperimentEvent>]
      required :events, -> { Braintrust::ArrayOf[Braintrust::Models::InsertExperimentEvent] }

      # @!parse
      #   # @param events [Array<Braintrust::Models::InsertExperimentEvent>]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(events:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
