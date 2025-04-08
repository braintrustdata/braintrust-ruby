# typed: strong

module Braintrust
  module Models
    class SpanIFrame < Braintrust::Internal::Type::BaseModel
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
      #   useful when you want to render more data than fits in the URL.
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
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        project_id:,
        url:,
        created: nil,
        deleted_at: nil,
        description: nil,
        post_message: nil,
        user_id: nil
      ); end
      sig do
        override
          .returns(
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
      def to_hash; end
    end
  end
end
