# typed: strong

module Braintrust
  module Models
    class Dataset < Braintrust::BaseModel
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
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
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
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          user_id: T.nilable(String)
        )
          .void
      end
      def initialize(
        id:,
        name:,
        project_id:,
        created: nil,
        deleted_at: nil,
        description: nil,
        metadata: nil,
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
              created: T.nilable(Time),
              deleted_at: T.nilable(Time),
              description: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
