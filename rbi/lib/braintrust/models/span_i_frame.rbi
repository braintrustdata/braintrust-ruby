# typed: strong

module Braintrust
  module Models
    class SpanIFrame < Braintrust::BaseModel
      # Unique identifier for the span iframe
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the span iframe
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the span iframe belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # URL to embed the project viewer in an iframe
      sig { returns(String) }
      def url
      end

      sig { params(_: String).returns(String) }
      def url=(_)
      end

      # Date of span iframe creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Date of span iframe deletion, or null if the span iframe is still active
      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      # Textual description of the span iframe
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # Whether to post messages to the iframe containing the span's data. This is
      #   useful when you want to render more data than fits in the URL.
      sig { returns(T.nilable(T::Boolean)) }
      def post_message
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def post_message=(_)
      end

      # Identifies the user who created the span iframe
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

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
      )
      end

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
      def to_hash
      end
    end
  end
end
