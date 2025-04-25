# typed: strong

module Braintrust
  module Models
    class FeedbackProjectLogsItem < Braintrust::Internal::Type::BaseModel
      # The id of the project logs event to log feedback for. This is the row `id`
      # returned by `POST /v1/project_logs/{project_id}/insert`
      sig { returns(String) }
      attr_accessor :id

      # An optional comment string to log about the project logs event
      sig { returns(T.nilable(String)) }
      attr_accessor :comment

      # The ground truth value (an arbitrary, JSON serializable object) that you'd
      # compare to `output` to determine if your `output` value is correct or not
      sig { returns(T.nilable(T.anything)) }
      attr_reader :expected

      sig { params(expected: T.anything).void }
      attr_writer :expected

      # A dictionary with additional data about the feedback. If you have a `user_id`,
      # you can log it here and access it in the Braintrust UI. Note, this metadata does
      # not correspond to the main event itself, but rather the audit log attached to
      # the event.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # A dictionary of numeric values (between 0 and 1) to log. These scores will be
      # merged into the existing scores for the project logs event
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(Float)])) }
      attr_accessor :scores

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      sig { returns(T.nilable(Braintrust::Models::FeedbackProjectLogsItem::Source::OrSymbol)) }
      attr_accessor :source

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          comment: T.nilable(String),
          expected: T.anything,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          source: T.nilable(Braintrust::Models::FeedbackProjectLogsItem::Source::OrSymbol),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
        # The id of the project logs event to log feedback for. This is the row `id`
        # returned by `POST /v1/project_logs/{project_id}/insert`
        id:,
        # An optional comment string to log about the project logs event
        comment: nil,
        # The ground truth value (an arbitrary, JSON serializable object) that you'd
        # compare to `output` to determine if your `output` value is correct or not
        expected: nil,
        # A dictionary with additional data about the feedback. If you have a `user_id`,
        # you can log it here and access it in the Braintrust UI. Note, this metadata does
        # not correspond to the main event itself, but rather the audit log attached to
        # the event.
        metadata: nil,
        # A dictionary of numeric values (between 0 and 1) to log. These scores will be
        # merged into the existing scores for the project logs event
        scores: nil,
        # The source of the feedback. Must be one of "external" (default), "app", or "api"
        source: nil,
        # A list of tags to log
        tags: nil
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              comment: T.nilable(String),
              expected: T.anything,
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
              source: T.nilable(Braintrust::Models::FeedbackProjectLogsItem::Source::OrSymbol),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash; end

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      module Source
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FeedbackProjectLogsItem::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        APP = T.let(:app, Braintrust::Models::FeedbackProjectLogsItem::Source::TaggedSymbol)
        API = T.let(:api, Braintrust::Models::FeedbackProjectLogsItem::Source::TaggedSymbol)
        EXTERNAL = T.let(:external, Braintrust::Models::FeedbackProjectLogsItem::Source::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::FeedbackProjectLogsItem::Source::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
