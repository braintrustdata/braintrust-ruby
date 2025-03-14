# typed: strong

module Braintrust
  class ListObjects
    include Braintrust::BasePage

    Elem = type_member

    sig { returns(T::Array[Elem]) }
    def objects
    end

    sig { params(_: T::Array[Elem]).returns(T::Array[Elem]) }
    def objects=(_)
    end
  end
end
