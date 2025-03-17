# typed: strong

module Braintrust
  module Models
    class FeedbackExperimentItem < Braintrust::BaseModel
      # The id of the experiment event to log feedback for. This is the row `id`
      #   returned by `POST /v1/experiment/{experiment_id}/insert`
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # An optional comment string to log about the experiment event
      sig { returns(T.nilable(String)) }
      def comment
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comment=(_)
      end

      # The ground truth value (an arbitrary, JSON serializable object) that you'd
      #   compare to `output` to determine if your `output` value is correct or not
      sig { returns(T.nilable(T.anything)) }
      def expected
      end

      sig { params(_: T.anything).returns(T.anything) }
      def expected=(_)
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

      # A dictionary of numeric values (between 0 and 1) to log. These scores will be
      #   merged into the existing scores for the experiment event
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(Float)])) }
      def scores
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(Float)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(Float)]))
      end
      def scores=(_)
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
          expected: T.anything,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          source: T.nilable(Symbol),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(id:, comment: nil, expected: nil, metadata: nil, scores: nil, source: nil, tags: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              comment: T.nilable(String),
              expected: T.anything,
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
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

        Value = type_template(:out) { {fixed: Symbol} }

        APP = :app
        API = :api
        EXTERNAL = :external
      end
    end
  end
end
