# typed: strong

module Braintrust
  module Models
    class InsertEventsResponse < Braintrust::Internal::Type::BaseModel
      # The ids of all rows that were inserted, aligning one-to-one with the rows
      # provided as input
      sig { returns(T::Array[String]) }
      attr_accessor :row_ids

      sig { params(row_ids: T::Array[String]).returns(T.attached_class) }
      def self.new(
        # The ids of all rows that were inserted, aligning one-to-one with the rows
        # provided as input
        row_ids:
      ); end
      sig { override.returns({row_ids: T::Array[String]}) }
      def to_hash; end
    end
  end
end
