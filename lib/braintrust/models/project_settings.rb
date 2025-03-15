# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectSettings < Braintrust::BaseModel
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
               -> { Braintrust::ArrayOf[Braintrust::Models::ProjectSettings::SpanFieldOrder] },
               api_name: :spanFieldOrder,
               nil?: true

      # @!parse
      #   # @param baseline_experiment_id [String, nil]
      #   # @param comparison_key [String, nil]
      #   # @param span_field_order [Array<Braintrust::Models::ProjectSettings::SpanFieldOrder>, nil]
      #   #
      #   def initialize(baseline_experiment_id: nil, comparison_key: nil, span_field_order: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      class SpanFieldOrder < Braintrust::BaseModel
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

        # @!parse
        #   # @param column_id [String]
        #   # @param object_type [String]
        #   # @param position [String]
        #   # @param layout [Symbol, Braintrust::Models::ProjectSettings::SpanFieldOrder::Layout, nil]
        #   #
        #   def initialize(column_id:, object_type:, position:, layout: nil, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void

        # @abstract
        class Layout < Braintrust::Enum
          FULL = :full
          TWO_COLUMN = :two_column

          finalize!
        end
      end
    end
  end
end
