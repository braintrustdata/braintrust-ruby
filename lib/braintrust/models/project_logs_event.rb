# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectLogsEvent < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier for the project logs event. If you don't provide one,
      #   BrainTrust will generate one for you
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the project logs (see the
      #   `version` parameter)
      #
      #   @return [String]
      required :_xact_id, String

      # @!attribute created
      #   The timestamp the project logs event was created
      #
      #   @return [Time]
      required :created, Time

      # @!attribute log_id
      #   A literal 'g' which identifies the log as a project log
      #
      #   @return [Symbol, Braintrust::Models::ProjectLogsEvent::LogID]
      required :log_id, enum: -> { Braintrust::Models::ProjectLogsEvent::LogID }

      # @!attribute org_id
      #   Unique id for the organization that the project belongs under
      #
      #   @return [String]
      required :org_id, String

      # @!attribute project_id
      #   Unique identifier for the project
      #
      #   @return [String]
      required :project_id, String

      # @!attribute root_span_id
      #   A unique identifier for the trace this project logs event belongs to
      #
      #   @return [String]
      required :root_span_id, String

      # @!attribute span_id
      #   A unique identifier used to link different project logs events together as part
      #   of a full trace. See the
      #   [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      #   on tracing
      #
      #   @return [String]
      required :span_id, String

      # @!attribute context
      #   Context is additional information about the code that produced the project logs
      #   event. It is essentially the textual counterpart to `metrics`. Use the
      #   `caller_*` attributes to track the location in code which produced the project
      #   logs event
      #
      #   @return [Braintrust::Models::ProjectLogsEvent::Context, nil]
      optional :context, -> { Braintrust::Models::ProjectLogsEvent::Context }, nil?: true

      # @!attribute error
      #   The error that occurred, if any.
      #
      #   @return [Object, nil]
      optional :error, Braintrust::Internal::Type::Unknown

      # @!attribute expected
      #   The ground truth value (an arbitrary, JSON serializable object) that you'd
      #   compare to `output` to determine if your `output` value is correct or not.
      #   Braintrust currently does not compare `output` to `expected` for you, since
      #   there are so many different ways to do that correctly. Instead, these values are
      #   just used to help you navigate while digging into analyses. However, we may
      #   later use these values to re-score outputs or fine-tune your models.
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!attribute input
      #   The arguments that uniquely define a user input (an arbitrary, JSON serializable
      #   object).
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Internal::Type::Unknown

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
      #   @return [Braintrust::Models::ProjectLogsEvent::Metadata, nil]
      optional :metadata, -> { Braintrust::Models::ProjectLogsEvent::Metadata }, nil?: true

      # @!attribute metrics
      #   Metrics are numerical measurements tracking the execution of the code that
      #   produced the project logs event. Use "start" and "end" to track the time span
      #   over which the project logs event was produced
      #
      #   @return [Braintrust::Models::ProjectLogsEvent::Metrics, nil]
      optional :metrics, -> { Braintrust::Models::ProjectLogsEvent::Metrics }, nil?: true

      # @!attribute origin
      #   Indicates the event was copied from another object.
      #
      #   @return [Braintrust::Models::ObjectReference, nil]
      optional :origin, -> { Braintrust::Models::ObjectReference }, nil?: true

      # @!attribute output
      #   The output of your application, including post-processing (an arbitrary, JSON
      #   serializable object), that allows you to determine whether the result is correct
      #   or not. For example, in an app that generates SQL queries, the `output` should
      #   be the _result_ of the SQL query generated by the model, not the query itself,
      #   because there may be multiple valid queries that answer a single question.
      #
      #   @return [Object, nil]
      optional :output, Braintrust::Internal::Type::Unknown

      # @!attribute scores
      #   A dictionary of numeric values (between 0 and 1) to log. The scores should give
      #   you a variety of signals that help you determine how accurate the outputs are
      #   compared to what you expect and diagnose failures. For example, a summarization
      #   app might have one score that tells you how accurate the summary is, and another
      #   that measures the word similarity between the generated and grouth truth
      #   summary. The word similarity score could help you determine whether the
      #   summarization was covering similar concepts or not. You can use these scores to
      #   help you sort, filter, and compare logs.
      #
      #   @return [Hash{Symbol=>Float, nil}, nil]
      optional :scores, Braintrust::Internal::Type::HashOf[Float, nil?: true], nil?: true

      # @!attribute span_attributes
      #   Human-identifying attributes of the span, such as name, type, etc.
      #
      #   @return [Braintrust::Models::SpanAttributes, nil]
      optional :span_attributes, -> { Braintrust::Models::SpanAttributes }, nil?: true

      # @!attribute span_parents
      #   An array of the parent `span_ids` of this project logs event. This should be
      #   empty for the root span of a trace, and should most often contain just one
      #   parent element for subspans
      #
      #   @return [Array<String>, nil]
      optional :span_parents, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(id:, _xact_id:, created:, log_id:, org_id:, project_id:, root_span_id:, span_id:, context: nil, error: nil, expected: nil, input: nil, is_root: nil, metadata: nil, metrics: nil, origin: nil, output: nil, scores: nil, span_attributes: nil, span_parents: nil, tags: nil)
      #   @param id [String]
      #   @param _xact_id [String]
      #   @param created [Time]
      #   @param log_id [Symbol, Braintrust::Models::ProjectLogsEvent::LogID]
      #   @param org_id [String]
      #   @param project_id [String]
      #   @param root_span_id [String]
      #   @param span_id [String]
      #   @param context [Braintrust::Models::ProjectLogsEvent::Context, nil]
      #   @param error [Object]
      #   @param expected [Object]
      #   @param input [Object]
      #   @param is_root [Boolean, nil]
      #   @param metadata [Braintrust::Models::ProjectLogsEvent::Metadata, nil]
      #   @param metrics [Braintrust::Models::ProjectLogsEvent::Metrics, nil]
      #   @param origin [Braintrust::Models::ObjectReference, nil]
      #   @param output [Object]
      #   @param scores [Hash{Symbol=>Float, nil}, nil]
      #   @param span_attributes [Braintrust::Models::SpanAttributes, nil]
      #   @param span_parents [Array<String>, nil]
      #   @param tags [Array<String>, nil]

      # A literal 'g' which identifies the log as a project log
      #
      # @see Braintrust::Models::ProjectLogsEvent#log_id
      module LogID
        extend Braintrust::Internal::Type::Enum

        G = :g

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Braintrust::Models::ProjectLogsEvent#context
      class Context < Braintrust::Internal::Type::BaseModel
        # @!attribute caller_filename
        #   Name of the file in code where the project logs event was created
        #
        #   @return [String, nil]
        optional :caller_filename, String, nil?: true

        # @!attribute caller_functionname
        #   The function in code which created the project logs event
        #
        #   @return [String, nil]
        optional :caller_functionname, String, nil?: true

        # @!attribute caller_lineno
        #   Line of code where the project logs event was created
        #
        #   @return [Integer, nil]
        optional :caller_lineno, Integer, nil?: true

        # @!method initialize(caller_filename: nil, caller_functionname: nil, caller_lineno: nil)
        #   Context is additional information about the code that produced the project logs
        #   event. It is essentially the textual counterpart to `metrics`. Use the
        #   `caller_*` attributes to track the location in code which produced the project
        #   logs event
        #
        #   @param caller_filename [String, nil]
        #   @param caller_functionname [String, nil]
        #   @param caller_lineno [Integer, nil]
      end

      # @see Braintrust::Models::ProjectLogsEvent#metadata
      class Metadata < Braintrust::Internal::Type::BaseModel
        # @!attribute model
        #   The model used for this example
        #
        #   @return [String, nil]
        optional :model, String, nil?: true

        # @!method initialize(model: nil)
        #   A dictionary with additional data about the test example, model outputs, or just
        #   about anything else that's relevant, that you can use to help find and analyze
        #   examples later. For example, you could log the `prompt`, example's `id`, or
        #   anything else that would be useful to slice/dice later. The values in `metadata`
        #   can be any JSON-serializable type, but its keys must be strings
        #
        #   @param model [String, nil]
      end

      # @see Braintrust::Models::ProjectLogsEvent#metrics
      class Metrics < Braintrust::Internal::Type::BaseModel
        # @!attribute caller_filename
        #   This metric is deprecated
        #
        #   @return [Object, nil]
        optional :caller_filename, Braintrust::Internal::Type::Unknown

        # @!attribute caller_functionname
        #   This metric is deprecated
        #
        #   @return [Object, nil]
        optional :caller_functionname, Braintrust::Internal::Type::Unknown

        # @!attribute caller_lineno
        #   This metric is deprecated
        #
        #   @return [Object, nil]
        optional :caller_lineno, Braintrust::Internal::Type::Unknown

        # @!attribute completion_tokens
        #   The number of tokens in the completion generated by the model (only set if this
        #   is an LLM span)
        #
        #   @return [Integer, nil]
        optional :completion_tokens, Integer, nil?: true

        # @!attribute end_
        #   A unix timestamp recording when the section of code which produced the project
        #   logs event finished
        #
        #   @return [Float, nil]
        optional :end_, Float, api_name: :end, nil?: true

        # @!attribute prompt_tokens
        #   The number of tokens in the prompt used to generate the project logs event (only
        #   set if this is an LLM span)
        #
        #   @return [Integer, nil]
        optional :prompt_tokens, Integer, nil?: true

        # @!attribute start
        #   A unix timestamp recording when the section of code which produced the project
        #   logs event started
        #
        #   @return [Float, nil]
        optional :start, Float, nil?: true

        # @!attribute tokens
        #   The total number of tokens in the input and output of the project logs event.
        #
        #   @return [Integer, nil]
        optional :tokens, Integer, nil?: true

        # @!method initialize(caller_filename: nil, caller_functionname: nil, caller_lineno: nil, completion_tokens: nil, end_: nil, prompt_tokens: nil, start: nil, tokens: nil)
        #   Metrics are numerical measurements tracking the execution of the code that
        #   produced the project logs event. Use "start" and "end" to track the time span
        #   over which the project logs event was produced
        #
        #   @param caller_filename [Object]
        #   @param caller_functionname [Object]
        #   @param caller_lineno [Object]
        #   @param completion_tokens [Integer, nil]
        #   @param end_ [Float, nil]
        #   @param prompt_tokens [Integer, nil]
        #   @param start [Float, nil]
        #   @param tokens [Integer, nil]
      end
    end
  end
end
