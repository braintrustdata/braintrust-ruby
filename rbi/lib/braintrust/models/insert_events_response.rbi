# typed: strong

module Braintrust
  module Models
    class InsertEventsResponse < Braintrust::BaseModel
      # The ids of all rows that were inserted, aligning one-to-one with the rows
      #   provided as input
      sig { returns(T::Array[String]) }
      def row_ids
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def row_ids=(_)
      end

      sig { params(row_ids: T::Array[String]).returns(T.attached_class) }
      def self.new(row_ids:)
      end

      sig { override.returns({row_ids: T::Array[String]}) }
      def to_hash
      end
    end
  end
end
