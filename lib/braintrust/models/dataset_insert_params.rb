# frozen_string_literal: true

module Braintrust
  module Models
    class DatasetInsertParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute events
      #   A list of dataset events to insert
      #
      #   @return [Array<Braintrust::Models::InsertDatasetEvent>]
      required :events, -> { Braintrust::ArrayOf[Braintrust::Models::InsertDatasetEvent] }

      # @!parse
      #   # @param events [Array<Braintrust::Models::InsertDatasetEvent>]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(events:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
