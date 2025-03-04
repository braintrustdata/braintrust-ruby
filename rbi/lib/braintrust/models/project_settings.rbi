# typed: strong

module Braintrust
  module Models
    class ProjectSettings < Braintrust::BaseModel
      sig { returns(T.nilable(String)) }
      def comparison_key
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comparison_key=(_)
      end

      sig { params(comparison_key: T.nilable(String)).void }
      def initialize(comparison_key: nil)
      end

      sig { override.returns({comparison_key: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
