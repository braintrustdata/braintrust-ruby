# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectSettings < Braintrust::Internal::Type::BaseModel
      # @!attribute baseline_experiment_id
      #   The id of the experiment to use as the default baseline for comparisons
      #
      #   @return [String, nil]
      optional :baseline_experiment_id, String, nil?: true

      # @!attribute comparison_key
      #   The key used to join two experiments (defaults to `input`)
      #
      #   @return [String, nil]
      optional :comparison_key, String, nil?: true

      # @!attribute span_field_order
      #   The order of the fields to display in the trace view
      #
      #   @return [Array<Braintrust::Models::ProjectSettings::SpanFieldOrder>, nil]
      optional :span_field_order,
               -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::ProjectSettings::SpanFieldOrder] },
               api_name: :spanFieldOrder,
               nil?: true

      # @!method initialize(baseline_experiment_id: nil, comparison_key: nil, span_field_order: nil)
      #   @param baseline_experiment_id [String, nil]
      #   @param comparison_key [String, nil]
      #   @param span_field_order [Array<Braintrust::Models::ProjectSettings::SpanFieldOrder>, nil]

      class SpanFieldOrder < Braintrust::Internal::Type::BaseModel
        # @!attribute column_id
        #
        #   @return [String]
        required :column_id, String

        # @!attribute object_type
        #
        #   @return [String]
        required :object_type, String

        # @!attribute position
        #
        #   @return [String]
        required :position, String

        # @!attribute layout
        #
        #   @return [Symbol, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout, nil]
        optional :layout, enum: -> { Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout }, nil?: true

        # @!method initialize(column_id:, object_type:, position:, layout: nil)
        #   @param column_id [String]
        #   @param object_type [String]
        #   @param position [String]
        #   @param layout [Symbol, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout, nil]

        # @see Braintrust::Models::ProjectSettings::SpanFieldOrder#layout
        module Layout
          extend Braintrust::Internal::Type::Enum

          FULL = :full
          TWO_COLUMN = :two_column

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
