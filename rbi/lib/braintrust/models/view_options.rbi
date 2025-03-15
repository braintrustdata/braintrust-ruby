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

      sig { returns(T.nilable(String)) }
      def grouping
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def grouping=(_)
      end

      sig { returns(T.nilable(String)) }
      def layout
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def layout=(_)
      end

      sig { returns(T.nilable(String)) }
      def row_height
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def row_height=(_)
      end

      # Options for the view in the app
      sig do
        params(
          column_order: T.nilable(T::Array[String]),
          column_sizing: T.nilable(T::Hash[Symbol, Float]),
          column_visibility: T.nilable(T::Hash[Symbol, T::Boolean]),
          grouping: T.nilable(String),
          layout: T.nilable(String),
          row_height: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(column_order: nil, column_sizing: nil, column_visibility: nil, grouping: nil, layout: nil, row_height: nil)
      end

      sig do
        override
          .returns(
            {
              column_order: T.nilable(T::Array[String]),
              column_sizing: T.nilable(T::Hash[Symbol, Float]),
              column_visibility: T.nilable(T::Hash[Symbol, T::Boolean]),
              grouping: T.nilable(String),
              layout: T.nilable(String),
              row_height: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
