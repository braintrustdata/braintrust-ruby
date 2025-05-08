# typed: strong

module Braintrust
  module Models
    module Projects
      class LogFeedbackParams < Braintrust::Internal::Type::BaseModel
        extend Braintrust::Internal::Type::RequestParameters::Converter
        include Braintrust::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        # A list of project logs feedback items
        sig { returns(T::Array[Braintrust::FeedbackProjectLogsItem]) }
        attr_accessor :feedback

        sig do
          params(
            feedback: T::Array[Braintrust::FeedbackProjectLogsItem::OrHash],
            request_options: Braintrust::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A list of project logs feedback items
          feedback:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              feedback: T::Array[Braintrust::FeedbackProjectLogsItem],
              request_options: Braintrust::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
