# frozen_string_literal: true

module Braintrust
  module Models
    class DatasetEvent < Braintrust::BaseModel
      # @!attribute id
      #   A unique identifier for the dataset event. If you don't provide one, BrainTrust
      #     will generate one for you
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   The transaction id of an event is unique to the network operation that processed
      #     the event insertion. Transaction ids are monotonically increasing over time and
      #     can be used to retrieve a versioned snapshot of the dataset (see the `version`
      #     parameter)
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
      #     full trace. See the
      #     [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      #     on tracing
      #
      #   @return [String]
      required :span_id, String

      # @!attribute [r] expected
      #   The output of your application, including post-processing (an arbitrary, JSON
      #     serializable object)
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :expected

      # @!attribute [r] input
      #   The argument that uniquely define an input case (an arbitrary, JSON serializable
      #     object)
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :input

      # @!attribute is_root
      #   Whether this span is a root span
      #
      #   @return [Boolean, nil]
      optional :is_root, Braintrust::BooleanModel, nil?: true

      # @!attribute metadata
      #   A dictionary with additional data about the test example, model outputs, or just
      #     about anything else that's relevant, that you can use to help find and analyze
      #     examples later. For example, you could log the `prompt`, example's `id`, or
      #     anything else that would be useful to slice/dice later. The values in `metadata`
      #     can be any JSON-serializable type, but its keys must be strings
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute origin
      #   Indicates the event was copied from another object.
      #
      #   @return [Braintrust::Models::DatasetEvent::Origin, nil]
      optional :origin, -> { Braintrust::Models::DatasetEvent::Origin }, nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::ArrayOf[String], nil?: true

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
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param origin [Braintrust::Models::DatasetEvent::Origin, nil]
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

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      class Origin < Braintrust::BaseModel
        # @!attribute id
        #   ID of the original event.
        #
        #   @return [String]
        required :id, String

        # @!attribute _xact_id
        #   Transaction ID of the original event.
        #
        #   @return [String]
        required :_xact_id, String

        # @!attribute object_id_
        #   ID of the object the event is originating from.
        #
        #   @return [String]
        required :object_id_, String, api_name: :object_id

        # @!attribute object_type
        #   Type of the object the event is originating from.
        #
        #   @return [Symbol, Braintrust::Models::DatasetEvent::Origin::ObjectType]
        required :object_type, enum: -> { Braintrust::Models::DatasetEvent::Origin::ObjectType }

        # @!parse
        #   # Indicates the event was copied from another object.
        #   #
        #   # @param id [String]
        #   # @param _xact_id [String]
        #   # @param object_id_ [String]
        #   # @param object_type [Symbol, Braintrust::Models::DatasetEvent::Origin::ObjectType]
        #   #
        #   def initialize(id:, _xact_id:, object_id_:, object_type:, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void

        # @abstract
        #
        # Type of the object the event is originating from.
        #
        # @example
        # ```ruby
        # case object_type
        # in :experiment
        #   # ...
        # in :dataset
        #   # ...
        # in :prompt
        #   # ...
        # in :function
        #   # ...
        # in :prompt_session
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class ObjectType < Braintrust::Enum
          EXPERIMENT = :experiment
          DATASET = :dataset
          PROMPT = :prompt
          FUNCTION = :function
          PROMPT_SESSION = :prompt_session
          PROJECT_LOGS = :project_logs

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   #
          #   def self.values; end
        end
      end
    end
  end
end
