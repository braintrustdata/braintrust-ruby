# typed: strong

module Braintrust
  module Models
    class ProjectSettings < Braintrust::Internal::Type::BaseModel
      # The id of the experiment to use as the default baseline for comparisons
      sig { returns(T.nilable(String)) }
      attr_accessor :baseline_experiment_id

      # The key used to join two experiments (defaults to `input`)
      sig { returns(T.nilable(String)) }
      attr_accessor :comparison_key

      # The order of the fields to display in the trace view
      sig { returns(T.nilable(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder])) }
      attr_accessor :span_field_order

      sig do
        params(
          baseline_experiment_id: T.nilable(String),
          comparison_key: T.nilable(String),
          span_field_order: T.nilable(
            T::Array[T.any(Braintrust::Models::ProjectSettings::SpanFieldOrder, Braintrust::Internal::AnyHash)]
          )
        )
          .returns(T.attached_class)
      end
      def self.new(baseline_experiment_id: nil, comparison_key: nil, span_field_order: nil)
      end

      sig do
        override
          .returns(
            {
              baseline_experiment_id: T.nilable(String),
              comparison_key: T.nilable(String),
              span_field_order: T.nilable(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder])
            }
          )
      end
      def to_hash
      end

      class SpanFieldOrder < Braintrust::Internal::Type::BaseModel
        sig { returns(String) }
        attr_accessor :column_id

        sig { returns(String) }
        attr_accessor :object_type

        sig { returns(String) }
        attr_accessor :position

        sig { returns(T.nilable(Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::OrSymbol)) }
        attr_accessor :layout

        sig do
          params(
            column_id: String,
            object_type: String,
            position: String,
            layout: T.nilable(Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::OrSymbol)
          )
            .returns(T.attached_class)
        end
        def self.new(column_id:, object_type:, position:, layout: nil)
        end

        sig do
          override
            .returns(
              {
                column_id: String,
                object_type: String,
                position: String,
                layout: T.nilable(Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::OrSymbol)
              }
            )
        end
        def to_hash
        end

        module Layout
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol) }

          FULL = T.let(:full, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol)
          TWO_COLUMN =
            T.let(:two_column, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol)

          sig { override.returns(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
