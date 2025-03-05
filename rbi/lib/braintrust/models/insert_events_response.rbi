# typed: strong

module Braintrust
  module Models
    class InsertEventsResponse < Braintrust::BaseModel
      sig { returns(T::Array[String]) }
      def row_ids
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def row_ids=(_)
      end

      sig { params(row_ids: T::Array[String]).void }
      def initialize(row_ids:)
      end

      sig { override.returns({row_ids: T::Array[String]}) }
      def to_hash
      end
    end
  end
end
