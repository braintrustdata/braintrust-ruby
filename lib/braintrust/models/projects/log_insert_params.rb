# frozen_string_literal: true

module Braintrust
  module Models
    module Projects
      # @see Braintrust::Resources::Projects::Logs#insert
      class LogInsertParams < Braintrust::BaseModel
        # @!parse
        #   extend Braintrust::Type::RequestParameters::Converter
        include Braintrust::RequestParameters

        # @!attribute events
        #   A list of project logs events to insert
        #
        #   @return [Array<Braintrust::Models::InsertProjectLogsEvent>]
        required :events, -> { Braintrust::ArrayOf[Braintrust::Models::InsertProjectLogsEvent] }

        # @!parse
        #   # @param events [Array<Braintrust::Models::InsertProjectLogsEvent>]
        #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(events:, request_options: {}, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void
      end
    end
  end
end
