# frozen_string_literal: true

module Braintrust
  module Models
    class DatasetEvent < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier for the dataset event. If you don't provide one, BrainTrust
      #   will generate one for you
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the dataset (see the `version`
      #   parameter)
      #
      #   @return [String]
      required :_xact_id, String

      # @!attribute created
      #   The timestamp the dataset event was created
      #
      #   @return [Time]
      required :created, Time

      # @!attribute dataset_id
      #   Unique identifier for the dataset
      #
      #   @return [String]
      required :dataset_id, String

      # @!attribute project_id
      #   Unique identifier for the project that the dataset belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute root_span_id
      #   A unique identifier for the trace this dataset event belongs to
      #
      #   @return [String]
      required :root_span_id, String

      # @!attribute span_id
      #   A unique identifier used to link different dataset events together as part of a
      #   full trace. See the
      #   [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      #   on tracing
      #
      #   @return [String]
      required :span_id, String

      # @!attribute [r] expected
      #   The output of your application, including post-processing (an arbitrary, JSON
      #   serializable object)
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :expected

      # @!attribute [r] input
      #   The argument that uniquely define an input case (an arbitrary, JSON serializable
      #   object)
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :input

      # @!attribute is_root
      #   Whether this span is a root span
      #
      #   @return [Boolean, nil]
      optional :is_root, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute metadata
      #   A dictionary with additional data about the test example, model outputs, or just
      #   about anything else that's relevant, that you can use to help find and analyze
      #   examples later. For example, you could log the `prompt`, example's `id`, or
      #   anything else that would be useful to slice/dice later. The values in `metadata`
      #   can be any JSON-serializable type, but its keys must be strings
      #
      #   @return [Braintrust::Models::DatasetEvent::Metadata, nil]
      optional :metadata, -> { Braintrust::Models::DatasetEvent::Metadata }, nil?: true

      # @!attribute origin
      #   Indicates the event was copied from another object.
      #
      #   @return [Braintrust::Models::ObjectReference, nil]
      optional :origin, -> { Braintrust::Models::ObjectReference }, nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param _xact_id [String]
      #   # @param created [Time]
      #   # @param dataset_id [String]
      #   # @param project_id [String]
      #   # @param root_span_id [String]
      #   # @param span_id [String]
      #   # @param expected [Object]
      #   # @param input [Object]
      #   # @param is_root [Boolean, nil]
      #   # @param metadata [Braintrust::Models::DatasetEvent::Metadata, nil]
      #   # @param origin [Braintrust::Models::ObjectReference, nil]
      #   # @param tags [Array<String>, nil]
      #   #
      #   def initialize(
      #     id:,
      #     _xact_id:,
      #     created:,
      #     dataset_id:,
      #     project_id:,
      #     root_span_id:,
      #     span_id:,
      #     expected: nil,
      #     input: nil,
      #     is_root: nil,
      #     metadata: nil,
      #     origin: nil,
      #     tags: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # @see Braintrust::Models::DatasetEvent#metadata
      class Metadata < Braintrust::Internal::Type::BaseModel
        # @!attribute model
        #   The model used for this example
        #
        #   @return [String, nil]
        optional :model, String, nil?: true

        # @!parse
        #   # A dictionary with additional data about the test example, model outputs, or just
        #   # about anything else that's relevant, that you can use to help find and analyze
        #   # examples later. For example, you could log the `prompt`, example's `id`, or
        #   # anything else that would be useful to slice/dice later. The values in `metadata`
        #   # can be any JSON-serializable type, but its keys must be strings
        #   #
        #   # @param model [String, nil]
        #   #
        #   def initialize(model: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end
    end
  end
end
