# typed: strong

module Braintrust
  module Models
    class SpanIFrame < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::SpanIFrame, Braintrust::Internal::AnyHash)
        end

      # Unique identifier for the span iframe
      sig { returns(String) }
      attr_accessor :id

      # Name of the span iframe
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the span iframe belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # URL to embed the project viewer in an iframe
      sig { returns(String) }
      attr_accessor :url

      # Date of span iframe creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of span iframe deletion, or null if the span iframe is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Textual description of the span iframe
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Whether to post messages to the iframe containing the span's data. This is
      # useful when you want to render more data than fits in the URL.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :post_message

      # Identifies the user who created the span iframe
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          url: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          post_message: T.nilable(T::Boolean),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the span iframe
        id:,
        # Name of the span iframe
        name:,
        # Unique identifier for the project that the span iframe belongs under
        project_id:,
        # URL to embed the project viewer in an iframe
        url:,
        # Date of span iframe creation
        created: nil,
        # Date of span iframe deletion, or null if the span iframe is still active
        deleted_at: nil,
        # Textual description of the span iframe
        description: nil,
        # Whether to post messages to the iframe containing the span's data. This is
        # useful when you want to render more data than fits in the URL.
        post_message: nil,
        # Identifies the user who created the span iframe
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            project_id: String,
            url: String,
            created: T.nilable(Time),
            deleted_at: T.nilable(Time),
            description: T.nilable(String),
            post_message: T.nilable(T::Boolean),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
