# typed: strong

module Braintrust
  module Models
    class DatasetEvent < Braintrust::BaseModel
      # A unique identifier for the dataset event. If you don't provide one, BrainTrust
      #   will generate one for you
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the dataset (see the `version`
      #   parameter)
      sig { returns(String) }
      def _xact_id
      end

      sig { params(_: String).returns(String) }
      def _xact_id=(_)
      end

      # The timestamp the dataset event was created
      sig { returns(Time) }
      def created
      end

      sig { params(_: Time).returns(Time) }
      def created=(_)
      end

      # Unique identifier for the dataset
      sig { returns(String) }
      def dataset_id
      end

      sig { params(_: String).returns(String) }
      def dataset_id=(_)
      end

      # Unique identifier for the project that the dataset belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # A unique identifier for the trace this dataset event belongs to
      sig { returns(String) }
      def root_span_id
      end

      sig { params(_: String).returns(String) }
      def root_span_id=(_)
      end

      # A unique identifier used to link different dataset events together as part of a
      #   full trace. See the
      #   [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      #   on tracing
      sig { returns(String) }
      def span_id
      end

      sig { params(_: String).returns(String) }
      def span_id=(_)
      end

      # The output of your application, including post-processing (an arbitrary, JSON
      #   serializable object)
      sig { returns(T.nilable(T.anything)) }
      def expected
      end

      sig { params(_: T.anything).returns(T.anything) }
      def expected=(_)
      end

      # The argument that uniquely define an input case (an arbitrary, JSON serializable
      #   object)
      sig { returns(T.nilable(T.anything)) }
      def input
      end

      sig { params(_: T.anything).returns(T.anything) }
      def input=(_)
      end

      # Whether this span is a root span
      sig { returns(T.nilable(T::Boolean)) }
      def is_root
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_root=(_)
      end

      # A dictionary with additional data about the test example, model outputs, or just
      #   about anything else that's relevant, that you can use to help find and analyze
      #   examples later. For example, you could log the `prompt`, example's `id`, or
      #   anything else that would be useful to slice/dice later. The values in `metadata`
      #   can be any JSON-serializable type, but its keys must be strings
      sig { returns(T.nilable(Braintrust::Models::DatasetEvent::Metadata)) }
      def metadata
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::DatasetEvent::Metadata, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::DatasetEvent::Metadata, Braintrust::Util::AnyHash)))
      end
      def metadata=(_)
      end

      # Indicates the event was copied from another object.
      sig { returns(T.nilable(Braintrust::Models::ObjectReference)) }
      def origin
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Util::AnyHash)))
      end
      def origin=(_)
      end

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      def tags
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def tags=(_)
      end

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
          metadata: T.nilable(T.any(Braintrust::Models::DatasetEvent::Metadata, Braintrust::Util::AnyHash)),
          origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Util::AnyHash)),
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
      )
      end

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
      def to_hash
      end

      class Metadata < Braintrust::BaseModel
        # The model used for this example
        sig { returns(T.nilable(String)) }
        def model
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def model=(_)
        end

        # A dictionary with additional data about the test example, model outputs, or just
        #   about anything else that's relevant, that you can use to help find and analyze
        #   examples later. For example, you could log the `prompt`, example's `id`, or
        #   anything else that would be useful to slice/dice later. The values in `metadata`
        #   can be any JSON-serializable type, but its keys must be strings
        sig { params(model: T.nilable(String)).returns(T.attached_class) }
        def self.new(model: nil)
        end

        sig { override.returns({model: T.nilable(String)}) }
        def to_hash
        end
      end
    end
  end
end
