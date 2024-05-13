# frozen_string_literal: true

module Ruby
  module Models
    class DatasetFetchResponse < BaseModel
      # @!attribute [rw] events
      #   A list of fetched events
      #   @return [Array<Ruby::Models::DatasetFetchResponse::Event>]
      required :events, Ruby::ArrayOf.new(-> { Ruby::Models::DatasetFetchResponse::Event })

      # @!attribute [rw] cursor
      #   Pagination cursor
      # 
      # Pass this string directly as the `cursor` param to your next fetch request to get the next page of results. Not provided if the returned result set is empty.
      #   @return [String]
      optional :cursor, String

      class Event < BaseModel
        # @!attribute [rw] id
        #   A unique identifier for the dataset event. If you don't provide one, BrainTrust will generate one for you
        #   @return [String]
        required :id, String

        # @!attribute [rw] _xact_id
        #   The transaction id of an event is unique to the network operation that processed the event insertion. Transaction ids are monotonically increasing over time and can be used to retrieve a versioned snapshot of the dataset (see the `version` parameter)
        #   @return [String]
        required :_xact_id, String

        # @!attribute [rw] created
        #   The timestamp the dataset event was created
        #   @return [String]
        required :created, String

        # @!attribute [rw] dataset_id
        #   Unique identifier for the dataset
        #   @return [String]
        required :dataset_id, String

        # @!attribute [rw] root_span_id
        #   The `span_id` of the root of the trace this dataset event belongs to
        #   @return [String]
        required :root_span_id, String

        # @!attribute [rw] span_id
        #   A unique identifier used to link different dataset events together as part of a full trace. See the [tracing guide](https://www.braintrustdata.com/docs/guides/tracing) for full details on tracing
        #   @return [String]
        required :span_id, String

        # @!attribute [rw] expected
        #   The output of your application, including post-processing (an arbitrary, JSON serializable object)
        #   @return [Object]
        optional :expected, Ruby::Unknown

        # @!attribute [rw] input
        #   The argument that uniquely define an input case (an arbitrary, JSON serializable object)
        #   @return [Object]
        optional :input, Ruby::Unknown

        # @!attribute [rw] metadata
        #   A dictionary with additional data about the test example, model outputs, or just about anything else that's relevant, that you can use to help find and analyze examples later. For example, you could log the `prompt`, example's `id`, or anything else that would be useful to slice/dice later. The values in `metadata` can be any JSON-serializable type, but its keys must be strings
        #   @return [Hash]
        optional :metadata, Hash

        # @!attribute [rw] project_id
        #   Unique identifier for the project that the dataset belongs under
        #   @return [String]
        optional :project_id, String

        # @!attribute [rw] tags
        #   A list of tags to log
        #   @return [Array<String>]
        optional :tags, Ruby::ArrayOf.new(String)
      end
    end
  end
end
