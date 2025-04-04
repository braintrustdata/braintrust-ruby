# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#insert
    class DatasetInsertParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute events
      #   A list of dataset events to insert
      #
      #   @return [Array<Braintrust::Models::InsertDatasetEvent>]
      required :events, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::InsertDatasetEvent] }

      # @!parse
      #   # @param events [Array<Braintrust::Models::InsertDatasetEvent>]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(events:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
