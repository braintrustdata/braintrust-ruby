# typed: strong

module Braintrust
  module Models
    class FeedbackDatasetItem < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::FeedbackDatasetItem, Braintrust::Internal::AnyHash)
        end

      # The id of the dataset event to log feedback for. This is the row `id` returned
      # by `POST /v1/dataset/{dataset_id}/insert`
      sig { returns(String) }
      attr_accessor :id

      # An optional comment string to log about the dataset event
      sig { returns(T.nilable(String)) }
      attr_accessor :comment

      # A dictionary with additional data about the feedback. If you have a `user_id`,
      # you can log it here and access it in the Braintrust UI. Note, this metadata does
      # not correspond to the main event itself, but rather the audit log attached to
      # the event.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      sig do
        returns(T.nilable(Braintrust::FeedbackDatasetItem::Source::OrSymbol))
      end
      attr_accessor :source

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          comment: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          source: T.nilable(Braintrust::FeedbackDatasetItem::Source::OrSymbol),
          tags: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the dataset event to log feedback for. This is the row `id` returned
        # by `POST /v1/dataset/{dataset_id}/insert`
        id:,
        # An optional comment string to log about the dataset event
        comment: nil,
        # A dictionary with additional data about the feedback. If you have a `user_id`,
        # you can log it here and access it in the Braintrust UI. Note, this metadata does
        # not correspond to the main event itself, but rather the audit log attached to
        # the event.
        metadata: nil,
        # The source of the feedback. Must be one of "external" (default), "app", or "api"
        source: nil,
        # A list of tags to log
        tags: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            comment: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            source:
              T.nilable(Braintrust::FeedbackDatasetItem::Source::OrSymbol),
            tags: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end

      # The source of the feedback. Must be one of "external" (default), "app", or "api"
      module Source
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::FeedbackDatasetItem::Source)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        APP = T.let(:app, Braintrust::FeedbackDatasetItem::Source::TaggedSymbol)
        API = T.let(:api, Braintrust::FeedbackDatasetItem::Source::TaggedSymbol)
        EXTERNAL =
          T.let(
            :external,
            Braintrust::FeedbackDatasetItem::Source::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Braintrust::FeedbackDatasetItem::Source::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
