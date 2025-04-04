# typed: strong

module Braintrust
  module Internal
    class ListObjects
      Elem = type_member

      include Braintrust::Internal::Type::BasePage

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :objects

      sig { returns(String) }
      def inspect
      end
    end
  end
end
