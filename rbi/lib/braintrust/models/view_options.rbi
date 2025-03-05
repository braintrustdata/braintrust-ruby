# typed: strong

module Braintrust
  module Models
    class ViewOptions < Braintrust::BaseModel
      sig { returns(T.nilable(T::Array[String])) }
      def column_order
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def column_order=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, Float])) }
      def column_sizing
      end

      sig { params(_: T.nilable(T::Hash[Symbol, Float])).returns(T.nilable(T::Hash[Symbol, Float])) }
      def column_sizing=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T::Boolean])) }
      def column_visibility
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T::Boolean])).returns(T.nilable(T::Hash[Symbol, T::Boolean]))
      end
      def column_visibility=(_)
      end

      sig do
        params(
          column_order: T.nilable(T::Array[String]),
          column_sizing: T.nilable(T::Hash[Symbol, Float]),
          column_visibility: T.nilable(T::Hash[Symbol, T::Boolean])
        )
          .void
      end
      def initialize(column_order: nil, column_sizing: nil, column_visibility: nil)
      end

      sig do
        override
          .returns(
            {
              column_order: T.nilable(T::Array[String]),
              column_sizing: T.nilable(T::Hash[Symbol, Float]),
              column_visibility: T.nilable(T::Hash[Symbol, T::Boolean])
            }
          )
      end
      def to_hash
      end
    end
  end
end
