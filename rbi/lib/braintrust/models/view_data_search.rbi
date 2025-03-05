# typed: strong

module Braintrust
  module Models
    class ViewDataSearch < Braintrust::BaseModel
      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      def filter
      end

      sig do
        params(_: T.nilable(T::Array[T.nilable(T.anything)])).returns(T.nilable(T::Array[T.nilable(T.anything)]))
      end
      def filter=(_)
      end

      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      def match
      end

      sig do
        params(_: T.nilable(T::Array[T.nilable(T.anything)])).returns(T.nilable(T::Array[T.nilable(T.anything)]))
      end
      def match=(_)
      end

      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      def sort
      end

      sig do
        params(_: T.nilable(T::Array[T.nilable(T.anything)])).returns(T.nilable(T::Array[T.nilable(T.anything)]))
      end
      def sort=(_)
      end

      sig { returns(T.nilable(T::Array[T.nilable(T.anything)])) }
      def tag
      end

      sig do
        params(_: T.nilable(T::Array[T.nilable(T.anything)])).returns(T.nilable(T::Array[T.nilable(T.anything)]))
      end
      def tag=(_)
      end

      sig do
        params(
          filter: T.nilable(T::Array[T.nilable(T.anything)]),
          match: T.nilable(T::Array[T.nilable(T.anything)]),
          sort: T.nilable(T::Array[T.nilable(T.anything)]),
          tag: T.nilable(T::Array[T.nilable(T.anything)])
        )
          .void
      end
      def initialize(filter: nil, match: nil, sort: nil, tag: nil)
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
