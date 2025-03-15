# typed: strong

module Braintrust
  class ListObjects
    include Braintrust::BasePage

    Elem = type_member

    sig { returns(T.nilable(T::Array[Elem])) }
    def objects
    end

    sig { params(_: T.nilable(T::Array[Elem])).returns(T.nilable(T::Array[Elem])) }
    def objects=(_)
    end
  end
end
