# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#fetch_post
    class DatasetFetchPostParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute cursor
      #   An opaque string to be used as a cursor for the next page of results, in order
      #   from latest to earliest.
      #
      #   The string can be obtained directly from the `cursor` property of the previous
      #   fetch query
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute limit
      #   limit the number of traces fetched
      #
      #   Fetch queries may be paginated if the total result size is expected to be large
      #   (e.g. project_logs which accumulate over a long time). Note that fetch queries
      #   only support pagination in descending time order (from latest to earliest
      #   `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
      #   pages, except with an earlier `_xact_id`. This happens because pagination occurs
      #   over the whole version history of the event log. You will most likely want to
      #   exclude any such duplicate, outdated rows (by `id`) from your combined result
      #   set.
      #
      #   The `limit` parameter controls the number of full traces to return. So you may
      #   end up with more individual rows than the specified limit if you are fetching
      #   events containing traces.
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute max_root_span_id
      #   DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #   the 'cursor' argument going forwards.
      #
      #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #   Since a paginated fetch query returns results in order from latest to earliest,
      #   the cursor for the next page can be found as the row with the minimum (earliest)
      #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #   for an overview of paginating fetch queries.
      #
      #   @return [String, nil]
      optional :max_root_span_id, String, nil?: true

      # @!attribute max_xact_id
      #   DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #   the 'cursor' argument going forwards.
      #
      #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #   Since a paginated fetch query returns results in order from latest to earliest,
      #   the cursor for the next page can be found as the row with the minimum (earliest)
      #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #   for an overview of paginating fetch queries.
      #
      #   @return [String, nil]
      optional :max_xact_id, String, nil?: true

      # @!attribute version
      #   Retrieve a snapshot of events from a past time
      #
      #   The version id is essentially a filter on the latest event transaction id. You
      #   can use the `max_xact_id` returned by a past fetch as the version to reproduce
      #   that exact fetch.
      #
      #   @return [String, nil]
      optional :version, String, nil?: true

      # @!method initialize(cursor: nil, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::DatasetFetchPostParams} for more details.
      #
      #   @param cursor [String, nil] An opaque string to be used as a cursor for the next page of results, in order f
      #   ...
      #
      #   @param limit [Integer, nil] limit the number of traces fetched ...
      #
      #   @param max_root_span_id [String, nil] DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   ...
      #
      #   @param max_xact_id [String, nil] DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   ...
      #
      #   @param version [String, nil] Retrieve a snapshot of events from a past time ...
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
