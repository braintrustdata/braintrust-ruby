# typed: strong

module Braintrust
  module Models
    class DatasetEvent < Braintrust::Internal::Type::BaseModel
      # A unique identifier for the dataset event. If you don't provide one, BrainTrust
      # will generate one for you
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      # the event insertion. Transaction ids are monotonically increasing over time and
      # can be used to retrieve a versioned snapshot of the dataset (see the `version`
      # parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      # The timestamp the dataset event was created
      sig { returns(Time) }
      attr_accessor :created

      # Unique identifier for the dataset
      sig { returns(String) }
      attr_accessor :dataset_id

      # Unique identifier for the project that the dataset belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # A unique identifier for the trace this dataset event belongs to
      sig { returns(String) }
      attr_accessor :root_span_id

      # A unique identifier used to link different dataset events together as part of a
      # full trace. See the
      # [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      # on tracing
      sig { returns(String) }
      attr_accessor :span_id

      # The output of your application, including post-processing (an arbitrary, JSON
      # serializable object)
      sig { returns(T.nilable(T.anything)) }
      attr_reader :expected

      sig { params(expected: T.anything).void }
      attr_writer :expected

      # The argument that uniquely define an input case (an arbitrary, JSON serializable
      # object)
      sig { returns(T.nilable(T.anything)) }
      attr_reader :input

      sig { params(input: T.anything).void }
      attr_writer :input

      # Whether this span is a root span
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_root

      # A dictionary with additional data about the test example, model outputs, or just
      # about anything else that's relevant, that you can use to help find and analyze
      # examples later. For example, you could log the `prompt`, example's `id`, or
      # anything else that would be useful to slice/dice later. The values in `metadata`
      # can be any JSON-serializable type, but its keys must be strings
      sig { returns(T.nilable(Braintrust::Models::DatasetEvent::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: T.nilable(T.any(Braintrust::Models::DatasetEvent::Metadata, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :metadata

      # Indicates the event was copied from another object.
      sig { returns(T.nilable(Braintrust::Models::ObjectReference)) }
      attr_reader :origin

      sig { params(origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Internal::AnyHash))).void }
      attr_writer :origin

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          _xact_id: String,
          created: Time,
          dataset_id: String,
          project_id: String,
          root_span_id: String,
          span_id: String,
          expected: T.anything,
          input: T.anything,
          is_root: T.nilable(T::Boolean),
          metadata: T.nilable(T.any(Braintrust::Models::DatasetEvent::Metadata, Braintrust::Internal::AnyHash)),
          origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Internal::AnyHash)),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        _xact_id:,
        created:,
        dataset_id:,
        project_id:,
        root_span_id:,
        span_id:,
        expected: nil,
        input: nil,
        is_root: nil,
        metadata: nil,
        origin: nil,
        tags: nil
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              _xact_id: String,
              created: Time,
              dataset_id: String,
              project_id: String,
              root_span_id: String,
              span_id: String,
              expected: T.anything,
              input: T.anything,
              is_root: T.nilable(T::Boolean),
              metadata: T.nilable(Braintrust::Models::DatasetEvent::Metadata),
              origin: T.nilable(Braintrust::Models::ObjectReference),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash; end

      class Metadata < Braintrust::Internal::Type::BaseModel
        # The model used for this example
        sig { returns(T.nilable(String)) }
        attr_accessor :model

        # A dictionary with additional data about the test example, model outputs, or just
        # about anything else that's relevant, that you can use to help find and analyze
        # examples later. For example, you could log the `prompt`, example's `id`, or
        # anything else that would be useful to slice/dice later. The values in `metadata`
        # can be any JSON-serializable type, but its keys must be strings
        sig { params(model: T.nilable(String)).returns(T.attached_class) }
        def self.new(model: nil); end

        sig { override.returns({model: T.nilable(String)}) }
        def to_hash; end
      end
    end
  end
end
