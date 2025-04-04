# typed: strong

module Braintrust
  module Models
    class ViewDataSearch < Braintrust::Internal::Type::BaseModel
      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      attr_accessor :filter

      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      attr_accessor :match

      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      attr_accessor :sort

      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      attr_accessor :tag

      sig do
        params(
          filter: T.nilable(T::Array[T.nilable(T.anything)]),
          match: T.nilable(T::Array[T.nilable(T.anything)]),
          sort: T.nilable(T::Array[T.nilable(T.anything)]),
          tag: T.nilable(T::Array[T.nilable(T.anything)])
        )
          .returns(T.attached_class)
      end
      def self.new(filter: nil, match: nil, sort: nil, tag: nil)
      end

      sig do
        override
          .returns(
            {
              filter: T.nilable(T::Array[T.nilable(T.anything)]),
              match: T.nilable(T::Array[T.nilable(T.anything)]),
              sort: T.nilable(T::Array[T.nilable(T.anything)]),
              tag: T.nilable(T::Array[T.nilable(T.anything)])
            }
          )
      end
      def to_hash
      end
    end
  end
end
