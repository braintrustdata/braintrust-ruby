# typed: strong

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < Braintrust::BaseModel
      sig { returns(String) }
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
      end

      sig { returns(Symbol) }
      def status
      end

      sig { params(_: Symbol).returns(Symbol) }
      def status=(_)
      end

      sig { returns(T.nilable(String)) }
      def send_email_error
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def send_email_error=(_)
      end

      sig { params(org_id: String, status: Symbol, send_email_error: T.nilable(String)).void }
      def initialize(org_id:, status:, send_email_error: nil)
      end

      sig { override.returns({org_id: String, status: Symbol, send_email_error: T.nilable(String)}) }
      def to_hash
      end

      class Status < Braintrust::Enum
        abstract!

        SUCCESS = :success

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end
    end
  end
end
