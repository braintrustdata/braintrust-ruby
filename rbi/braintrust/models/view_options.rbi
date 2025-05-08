# typed: strong

module Braintrust
  module Models
    class ViewOptions < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :column_order

      sig { returns(T.nilable(T::Hash[Symbol, Float])) }
      attr_accessor :column_sizing

      sig { returns(T.nilable(T::Hash[Symbol, T::Boolean])) }
      attr_accessor :column_visibility

      sig { returns(T.nilable(String)) }
      attr_accessor :grouping

      sig { returns(T.nilable(String)) }
      attr_accessor :layout

      sig { returns(T.nilable(String)) }
      attr_accessor :row_height

      # Options for the view in the app
      sig do
        params(
          column_order: T.nilable(T::Array[String]),
          column_sizing: T.nilable(T::Hash[Symbol, Float]),
          column_visibility: T.nilable(T::Hash[Symbol, T::Boolean]),
          grouping: T.nilable(String),
          layout: T.nilable(String),
          row_height: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        column_order: nil,
        column_sizing: nil,
        column_visibility: nil,
        grouping: nil,
        layout: nil,
        row_height: nil
      )
      end

      sig do
        override.returns(
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
