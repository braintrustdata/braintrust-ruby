# typed: strong

module Braintrust
  class ListObjects
    include Braintrust::Type::BasePage

    Elem = type_member

    sig { returns(T.nilable(T::Array[Elem])) }
    attr_accessor :objects

    sig { returns(String) }
    def inspect
    end
  end
end
