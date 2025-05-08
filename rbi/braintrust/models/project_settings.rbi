# typed: strong

module Braintrust
  module Models
    class ProjectSettings < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # The id of the experiment to use as the default baseline for comparisons
      sig { returns(T.nilable(String)) }
      attr_accessor :baseline_experiment_id

      # The key used to join two experiments (defaults to `input`)
      sig { returns(T.nilable(String)) }
      attr_accessor :comparison_key

      # The order of the fields to display in the trace view
      sig do
        returns(
          T.nilable(T::Array[Braintrust::ProjectSettings::SpanFieldOrder])
        )
      end
      attr_accessor :span_field_order

      sig do
        params(
          baseline_experiment_id: T.nilable(String),
          comparison_key: T.nilable(String),
          span_field_order:
            T.nilable(
              T::Array[Braintrust::ProjectSettings::SpanFieldOrder::OrHash]
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the experiment to use as the default baseline for comparisons
        baseline_experiment_id: nil,
        # The key used to join two experiments (defaults to `input`)
        comparison_key: nil,
        # The order of the fields to display in the trace view
        span_field_order: nil
      )
      end

      sig do
        override.returns(
          {
            baseline_experiment_id: T.nilable(String),
            comparison_key: T.nilable(String),
            span_field_order:
              T.nilable(T::Array[Braintrust::ProjectSettings::SpanFieldOrder])
          }
        )
      end
      def to_hash
      end

      class SpanFieldOrder < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig { returns(String) }
        attr_accessor :column_id

        sig { returns(String) }
        attr_accessor :object_type

        sig { returns(String) }
        attr_accessor :position

        sig do
          returns(
            T.nilable(
              Braintrust::ProjectSettings::SpanFieldOrder::Layout::OrSymbol
            )
          )
        end
        attr_accessor :layout

        sig do
          params(
            column_id: String,
            object_type: String,
            position: String,
            layout:
              T.nilable(
                Braintrust::ProjectSettings::SpanFieldOrder::Layout::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(column_id:, object_type:, position:, layout: nil)
        end

        sig do
          override.returns(
            {
              column_id: String,
              object_type: String,
              position: String,
              layout:
                T.nilable(
                  Braintrust::ProjectSettings::SpanFieldOrder::Layout::OrSymbol
                )
            }
          )
        end
        def to_hash
        end

        module Layout
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Braintrust::ProjectSettings::SpanFieldOrder::Layout)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FULL =
            T.let(
              :full,
              Braintrust::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol
            )
          TWO_COLUMN =
            T.let(
              :two_column,
              Braintrust::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Braintrust::ProjectSettings::SpanFieldOrder::Layout::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
