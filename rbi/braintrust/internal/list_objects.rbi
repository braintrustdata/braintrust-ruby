# typed: strong

module Braintrust
  module Internal
    class ListObjects
      include Braintrust::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :objects

      # @api private
      sig { returns(String) }
      def inspect; end
    end
  end
end
