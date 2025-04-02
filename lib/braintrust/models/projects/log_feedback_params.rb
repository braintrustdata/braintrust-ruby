# frozen_string_literal: true

module Braintrust
  module Models
    module Projects
      # @see Braintrust::Resources::Projects::Logs#feedback
      class LogFeedbackParams < Braintrust::BaseModel
        # @!parse
        #   extend Braintrust::Type::RequestParameters::Converter
        include Braintrust::RequestParameters

        # @!attribute feedback
        #   A list of project logs feedback items
        #
        #   @return [Array<Braintrust::Models::FeedbackProjectLogsItem>]
        required :feedback, -> { Braintrust::ArrayOf[Braintrust::Models::FeedbackProjectLogsItem] }

        # @!parse
        #   # @param feedback [Array<Braintrust::Models::FeedbackProjectLogsItem>]
        #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(feedback:, request_options: {}, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void
      end
    end
  end
end
