# typed: strong

module Braintrust
  module Models
    class DataSummary < Braintrust::BaseModel
      # Total number of records in the dataset
      sig { returns(Integer) }
      def total_records
      end

      sig { params(_: Integer).returns(Integer) }
      def total_records=(_)
      end

      # Summary of a dataset's data
      sig { params(total_records: Integer).returns(T.attached_class) }
      def self.new(total_records:)
      end

      sig { override.returns({total_records: Integer}) }
      def to_hash
      end
    end
  end
end
