# typed: strong

module Braintrust
  module Models
    class ExperimentFetchParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      sig { returns(T.nilable(String)) }
      def max_root_span_id
      end

      sig { params(_: String).returns(String) }
      def max_root_span_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def max_xact_id
      end

      sig { params(_: String).returns(String) }
      def max_xact_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def version
      end

      sig { params(_: String).returns(String) }
      def version=(_)
      end

      sig do
        params(
          limit: T.nilable(Integer),
          max_root_span_id: String,
          max_xact_id: String,
          version: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              limit: T.nilable(Integer),
              max_root_span_id: String,
              max_xact_id: String,
              version: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
