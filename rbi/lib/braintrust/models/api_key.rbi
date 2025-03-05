# typed: strong

module Braintrust
  module Models
    class APIKey < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(String) }
      def preview_name
      end

      sig { params(_: String).returns(String) }
      def preview_name=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(String)) }
      def org_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_id=(_)
      end

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
          preview_name: String,
          created: T.nilable(Time),
          org_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .void
      end
      def initialize(id:, name:, preview_name:, created: nil, org_id: nil, user_id: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              preview_name: String,
              created: T.nilable(Time),
              org_id: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
