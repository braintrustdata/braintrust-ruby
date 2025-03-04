# typed: strong

module Braintrust
  module Models
    class DatasetSummarizeParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T::Boolean)) }
      def summarize_data
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def summarize_data=(_)
      end

      sig do
        params(
          summarize_data: T.nilable(T::Boolean),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(summarize_data: nil, request_options: {})
      end

      sig do
        override.returns({summarize_data: T.nilable(T::Boolean), request_options: Braintrust::RequestOptions})
      end
      def to_hash
      end
    end
  end
end
