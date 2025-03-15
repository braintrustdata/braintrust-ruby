# typed: strong

module Braintrust
  module Models
    module Projects
      class LogInsertParams < Braintrust::BaseModel
        extend Braintrust::RequestParameters::Converter
        include Braintrust::RequestParameters

        # A list of project logs events to insert
        sig { returns(T::Array[Braintrust::Models::InsertProjectLogsEvent]) }
        def events
        end

        sig do
          params(_: T::Array[Braintrust::Models::InsertProjectLogsEvent])
            .returns(T::Array[Braintrust::Models::InsertProjectLogsEvent])
        end
        def events=(_)
        end

        sig do
          params(
            events: T::Array[Braintrust::Models::InsertProjectLogsEvent],
            request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .returns(T.attached_class)
        end
        def self.new(events:, request_options: {})
        end

        sig do
          override
            .returns(
              {events: T::Array[Braintrust::Models::InsertProjectLogsEvent], request_options: Braintrust::RequestOptions}
            )
        end
        def to_hash
        end
      end
    end
  end
end
