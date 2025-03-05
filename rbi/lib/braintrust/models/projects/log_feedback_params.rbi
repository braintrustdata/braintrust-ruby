# typed: strong

module Braintrust
  module Models
    module Projects
      class LogFeedbackParams < Braintrust::BaseModel
        extend Braintrust::RequestParameters::Converter
        include Braintrust::RequestParameters

        sig { returns(T::Array[Braintrust::Models::FeedbackProjectLogsItem]) }
        def feedback
        end

        sig do
          params(_: T::Array[Braintrust::Models::FeedbackProjectLogsItem])
            .returns(T::Array[Braintrust::Models::FeedbackProjectLogsItem])
        end
        def feedback=(_)
        end

        sig do
          params(
            feedback: T::Array[Braintrust::Models::FeedbackProjectLogsItem],
            request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .void
        end
        def initialize(feedback:, request_options: {})
        end

        sig do
          override
            .returns(
              {feedback: T::Array[Braintrust::Models::FeedbackProjectLogsItem], request_options: Braintrust::RequestOptions}
            )
        end
        def to_hash
        end
      end
    end
  end
end
