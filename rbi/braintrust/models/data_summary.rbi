# typed: strong

module Braintrust
  module Models
    class DataSummary < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::DataSummary, Braintrust::Internal::AnyHash)
        end

      # Total number of records in the dataset
      sig { returns(Integer) }
      attr_accessor :total_records

      # Summary of a dataset's data
      sig { params(total_records: Integer).returns(T.attached_class) }
      def self.new(
        # Total number of records in the dataset
        total_records:
      )
      end

      sig { override.returns({ total_records: Integer }) }
      def to_hash
      end
    end
  end
end
