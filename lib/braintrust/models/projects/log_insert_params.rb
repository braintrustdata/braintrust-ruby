# frozen_string_literal: true

module Braintrust
  module Models
    module Projects
      # @see Braintrust::Resources::Projects::Logs#insert
      class LogInsertParams < Braintrust::Internal::Type::BaseModel
        extend Braintrust::Internal::Type::RequestParameters::Converter
        include Braintrust::Internal::Type::RequestParameters

        # @!attribute events
        #   A list of project logs events to insert
        #
        #   @return [Array<Braintrust::Models::InsertProjectLogsEvent>]
        required :events, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::InsertProjectLogsEvent] }

        # @!method initialize(events:, request_options: {})
        #   @param events [Array<Braintrust::Models::InsertProjectLogsEvent>] A list of project logs events to insert
        #
        #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
