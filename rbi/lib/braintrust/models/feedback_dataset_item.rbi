# typed: strong

module Braintrust
  module Models
    class FeedbackDatasetItem < Braintrust::BaseModel
      # The id of the dataset event to log feedback for. This is the row `id` returned
      #   by `POST /v1/dataset/{dataset_id}/insert`
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # An optional comment string to log about the dataset event
      sig { returns(T.nilable(String)) }
      def comment
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comment=(_)
      end

      # A dictionary with additional data about the feedback. If you have a `user_id`,
      #   you can log it here and access it in the Braintrust UI. Note, this metadata does
      #   not correspond to the main event itself, but rather the audit log attached to
      #   the event.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      sig { returns(T.nilable(Symbol)) }
      def source
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def source=(_)
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
          comment: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          source: T.nilable(Symbol),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(id:, comment: nil, metadata: nil, source: nil, tags: nil)
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

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      class Source < Braintrust::Enum
        abstract!

        APP = T.let(:app, T.nilable(Symbol))
        API = T.let(:api, T.nilable(Symbol))
        EXTERNAL = T.let(:external, T.nilable(Symbol))

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
