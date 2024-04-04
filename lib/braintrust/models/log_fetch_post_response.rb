# frozen_string_literal: true

module Braintrust
  module Models
    class LogFetchPostResponse < BaseModel
          # @!attribute [rw] events
          #   A list of fetched events
          #   @return [Array<Braintrust::Models::LogFetchPostResponse::Event>]
          required :events, Braintrust::ArrayOf.new(-> { Braintrust::Models::LogFetchPostResponse::Event })

          class Event < BaseModel
                # @!attribute [rw] id
                #   A unique identifier for the project logs event. If you don't provide one, BrainTrust will generate one for you
                #   @return [String]
                required :id, String

                # @!attribute [rw] _xact_id
                #   The transaction id of an event is unique to the network operation that processed the event insertion. Transaction ids are monotonically increasing over time and can be used to retrieve a versioned snapshot of the project logs (see the `version` parameter)
                #   @return [Integer]
                required :_xact_id, Integer

                # @!attribute [rw] log_id
                #   A literal 'g' which identifies the log as a project log
                #   @return [Symbol]
                required :log_id, Braintrust::Enum.new(:'g')

                # @!attribute [rw] org_id
                #   Unique id for the organization that the project belongs under
                #   @return [String]
                required :org_id, String

                # @!attribute [rw] project_id
                #   Unique identifier for the project
                #   @return [String]
                required :project_id, String

                # @!attribute [rw] root_span_id
                #   The `span_id` of the root of the trace this project logs event belongs to
                #   @return [String]
                required :root_span_id, String

                # @!attribute [rw] span_id
                #   A unique identifier used to link different project logs events together as part of a full trace. See the [tracing guide](https://www.braintrustdata.com/docs/guides/tracing) for full details on tracing
                #   @return [String]
                required :span_id, String

                # @!attribute [rw] context
                #   Context is additional information about the code that produced the project logs event. It is essentially the textual counterpart to `metrics`. Use the `caller_*` attributes to track the location in code which produced the project logs event
                #   @return [Braintrust::Models::LogFetchPostResponse::Event::Context]
                optional :context, -> { Braintrust::Models::LogFetchPostResponse::Event::Context }

                # @!attribute [rw] created
                #   The timestamp the project logs event was created
                #   @return [String]
                optional :created, String

                # @!attribute [rw] expected
                #   The ground truth value (an arbitrary, JSON serializable object) that you'd compare to `output` to determine if your `output` value is correct or not. Braintrust currently does not compare `output` to `expected` for you, since there are so many different ways to do that correctly. Instead, these values are just used to help you navigate while digging into analyses. However, we may later use these values to re-score outputs or fine-tune your models.
                #   @return [Object]
                optional :expected, Braintrust::Unknown

                # @!attribute [rw] input
                #   The arguments that uniquely define a user input(an arbitrary, JSON serializable object).
                #   @return [Object]
                optional :input, Braintrust::Unknown

                # @!attribute [rw] metadata
                #   A dictionary with additional data about the test example, model outputs, or just about anything else that's relevant, that you can use to help find and analyze examples later. For example, you could log the `prompt`, example's `id`, or anything else that would be useful to slice/dice later. The values in `metadata` can be any JSON-serializable type, but its keys must be strings
                #   @return [Hash]
                optional :metadata, Hash

                # @!attribute [rw] metrics
                #   Metrics are numerical measurements tracking the execution of the code that produced the project logs event. Use "start" and "end" to track the time span over which the project logs event was produced
                #   @return [Braintrust::Models::LogFetchPostResponse::Event::Metrics]
                optional :metrics, -> { Braintrust::Models::LogFetchPostResponse::Event::Metrics }

                # @!attribute [rw] output
                #   The output of your application, including post-processing (an arbitrary, JSON serializable object), that allows you to determine whether the result is correct or not. For example, in an app that generates SQL queries, the `output` should be the _result_ of the SQL query generated by the model, not the query itself, because there may be multiple valid queries that answer a single question.
                #   @return [Object]
                optional :output, Braintrust::Unknown

                # @!attribute [rw] scores
                #   A dictionary of numeric values (between 0 and 1) to log. The scores should give you a variety of signals that help you determine how accurate the outputs are compared to what you expect and diagnose failures. For example, a summarization app might have one score that tells you how accurate the summary is, and another that measures the word similarity between the generated and grouth truth summary. The word similarity score could help you determine whether the summarization was covering similar concepts or not. You can use these scores to help you sort, filter, and compare logs.
                #   @return [Hash]
                optional :scores, Hash

                # @!attribute [rw] span_attributes
                #   Human-identifying attributes of the span, such as name, type, etc.
                #   @return [Braintrust::Models::LogFetchPostResponse::Event::SpanAttributes]
                optional :span_attributes, -> { Braintrust::Models::LogFetchPostResponse::Event::SpanAttributes }

                # @!attribute [rw] span_parents
                #   An array of the parent `span_ids` of this project logs event. This should be empty for the root span of a trace, and should most often contain just one parent element for subspans
                #   @return [Array<String>]
                optional :span_parents, Braintrust::ArrayOf.new(String)

                class Context < BaseModel
                      # @!attribute [rw] caller_filename
                      #   Name of the file in code where the project logs event was created
                      #   @return [String]
                      optional :caller_filename, String

                      # @!attribute [rw] caller_functionname
                      #   The function in code which created the project logs event
                      #   @return [String]
                      optional :caller_functionname, String

                      # @!attribute [rw] caller_lineno
                      #   Line of code where the project logs event was created
                      #   @return [Integer]
                      optional :caller_lineno, Integer
                end

                class Metrics < BaseModel
                      # @!attribute [rw] end_
                      #   A unix timestamp recording when the section of code which produced the project logs event finished
                      #   @return [Float]
                      optional :end_, Float

                      # @!attribute [rw] start
                      #   A unix timestamp recording when the section of code which produced the project logs event started
                      #   @return [Float]
                      optional :start, Float
                end

                class SpanAttributes < BaseModel
                      # @!attribute [rw] name_
                      #   Name of the span, for display purposes only
                      #   @return [String]
                      optional :name_, String

                      # @!attribute [rw] type
                      #   Type of the span, for display purposes only
                      #   @return [Symbol]
                      optional :type, Braintrust::Enum.new(:llm, :score, :function, :eval, :task, :tool)
                end
          end
    end
  end
end
