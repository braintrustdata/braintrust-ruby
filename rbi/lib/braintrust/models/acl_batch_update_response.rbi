# typed: strong

module Braintrust
  module Models
    class ACLBatchUpdateResponse < Braintrust::BaseModel
      sig { returns(T::Array[Braintrust::Models::ACL]) }
      def added_acls
      end

      sig { params(_: T::Array[Braintrust::Models::ACL]).returns(T::Array[Braintrust::Models::ACL]) }
      def added_acls=(_)
      end

      sig { returns(T::Array[Braintrust::Models::ACL]) }
      def removed_acls
      end

      sig { params(_: T::Array[Braintrust::Models::ACL]).returns(T::Array[Braintrust::Models::ACL]) }
      def removed_acls=(_)
      end

      sig do
        params(added_acls: T::Array[Braintrust::Models::ACL], removed_acls: T::Array[Braintrust::Models::ACL]).void
      end
      def initialize(added_acls:, removed_acls:)
      end

      sig do
        override
          .returns({added_acls: T::Array[Braintrust::Models::ACL], removed_acls: T::Array[Braintrust::Models::ACL]})
      end
      def to_hash
      end
    end
  end
end
