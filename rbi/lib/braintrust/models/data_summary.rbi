# typed: strong

module Braintrust
  module Models
    class DataSummary < Braintrust::BaseModel
      sig { returns(Integer) }
      def total_records
      end

      sig { params(_: Integer).returns(Integer) }
      def total_records=(_)
      end

      sig { params(total_records: Integer).void }
      def initialize(total_records:)
      end

      sig { override.returns({total_records: Integer}) }
      def to_hash
      end
    end
  end
end
