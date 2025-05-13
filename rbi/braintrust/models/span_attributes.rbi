# typed: strong

module Braintrust
  module Models
    class SpanAttributes < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::SpanAttributes, Braintrust::Internal::AnyHash)
        end

      # Name of the span, for display purposes only
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Type of the span, for display purposes only
      sig { returns(T.nilable(Braintrust::SpanType::OrSymbol)) }
      attr_accessor :type

      # Human-identifying attributes of the span, such as name, type, etc.
      sig do
        params(
          name: T.nilable(String),
          type: T.nilable(Braintrust::SpanType::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the span, for display purposes only
        name: nil,
        # Type of the span, for display purposes only
        type: nil
      )
      end

      sig do
        override.returns(
          {
            name: T.nilable(String),
            type: T.nilable(Braintrust::SpanType::OrSymbol)
          }
        )
      end
      def to_hash
      end
    end
  end
end
