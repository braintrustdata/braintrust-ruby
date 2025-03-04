# typed: strong

module Braintrust
  module Models
    class FeedbackDatasetItem < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(T.nilable(String)) }
      def comment
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comment=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def source
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def source=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def tags
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def tags=(_)
      end

      sig do
        params(
          id: String,
          comment: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          source: T.nilable(Symbol),
          tags: T.nilable(T::Array[String])
        )
          .void
      end
      def initialize(id:, comment: nil, metadata: nil, source: nil, tags: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              comment: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              source: T.nilable(Symbol),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
      end

      class Source < Braintrust::Enum
        abstract!

        APP = T.let(:app, T.nilable(Symbol))
        API = T.let(:api, T.nilable(Symbol))
        EXTERNAL = T.let(:external, T.nilable(Symbol))

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end
    end
  end
end
