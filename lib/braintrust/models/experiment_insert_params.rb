# frozen_string_literal: true

module Braintrust
  module Models
    class ExperimentInsertParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

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
