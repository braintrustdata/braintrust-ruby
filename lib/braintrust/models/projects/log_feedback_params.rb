# frozen_string_literal: true

module Braintrust
  module Models
    module Projects
      # @see Braintrust::Resources::Projects::Logs#feedback
      class LogFeedbackParams < Braintrust::Internal::Type::BaseModel
        extend Braintrust::Internal::Type::RequestParameters::Converter
        include Braintrust::Internal::Type::RequestParameters

        # @!attribute feedback
        #   A list of project logs feedback items
        #
        #   @return [Array<Braintrust::Models::FeedbackProjectLogsItem>]
        required :feedback, -> { Braintrust::Internal::Type::ArrayOf[Braintrust::FeedbackProjectLogsItem] }

        # @!method initialize(feedback:, request_options: {})
        #   @param feedback [Array<Braintrust::Models::FeedbackProjectLogsItem>] A list of project logs feedback items
        #
        #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
