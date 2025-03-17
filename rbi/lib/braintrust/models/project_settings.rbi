# typed: strong

module Braintrust
  module Models
    class ProjectSettings < Braintrust::BaseModel
      # The id of the experiment to use as the default baseline for comparisons
      sig { returns(T.nilable(String)) }
      def baseline_experiment_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def baseline_experiment_id=(_)
      end

      # The key used to join two experiments (defaults to `input`)
      sig { returns(T.nilable(String)) }
      def comparison_key
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comparison_key=(_)
      end

      # The order of the fields to display in the trace view
      sig { returns(T.nilable(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder])) }
      def span_field_order
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder]))
          .returns(T.nilable(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder]))
      end
      def span_field_order=(_)
      end

      sig do
        params(
          baseline_experiment_id: T.nilable(String),
          comparison_key: T.nilable(String),
          span_field_order: T.nilable(T::Array[Braintrust::Models::ProjectSettings::SpanFieldOrder])
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

      class SpanFieldOrder < Braintrust::BaseModel
        sig { returns(String) }
        def column_id
        end

        sig { params(_: String).returns(String) }
        def column_id=(_)
        end

        sig { returns(String) }
        def object_type
        end

        sig { params(_: String).returns(String) }
        def object_type=(_)
        end

        sig { returns(String) }
        def position
        end

        sig { params(_: String).returns(String) }
        def position=(_)
        end

        sig { returns(T.nilable(Symbol)) }
        def layout
        end

        sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
        def layout=(_)
        end

        sig do
          params(column_id: String, object_type: String, position: String, layout: T.nilable(Symbol))
            .returns(T.attached_class)
        end
        def self.new(column_id:, object_type:, position:, layout: nil)
        end

        sig do
          override.returns(
            {
              column_id: String,
              object_type: String,
              position: String,
              layout: T.nilable(Symbol)
            }
          )
        end
        def to_hash
        end

        class Layout < Braintrust::Enum
          abstract!

          Value = type_template(:out) { {fixed: Symbol} }

          FULL = :full
          TWO_COLUMN = :two_column
        end
      end
    end
  end
end
