# typed: strong

module Braintrust
  module Models
    module Projects
      class LogFeedbackParams < Braintrust::BaseModel
        extend Braintrust::Type::RequestParameters::Converter
        include Braintrust::RequestParameters

        # A list of project logs feedback items
        sig { returns(T::Array[Braintrust::Models::FeedbackProjectLogsItem]) }
        attr_accessor :feedback

        sig do
          params(
            feedback: T::Array[T.any(Braintrust::Models::FeedbackProjectLogsItem, Braintrust::Util::AnyHash)],
            request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(feedback:, request_options: {})
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
