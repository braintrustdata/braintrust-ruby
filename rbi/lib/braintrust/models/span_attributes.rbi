# typed: strong

module Braintrust
  module Models
    class SpanAttributes < Braintrust::BaseModel
      # Name of the span, for display purposes only
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Type of the span, for display purposes only
      sig { returns(T.nilable(Braintrust::Models::SpanType::OrSymbol)) }
      attr_accessor :type

      # Human-identifying attributes of the span, such as name, type, etc.
      sig do
        params(name: T.nilable(String), type: T.nilable(Braintrust::Models::SpanType::OrSymbol))
          .returns(T.attached_class)
      end
      def self.new(name: nil, type: nil)
      end

      sig { override.returns({name: T.nilable(String), type: T.nilable(Braintrust::Models::SpanType::OrSymbol)}) }
      def to_hash
      end
    end
  end
end
