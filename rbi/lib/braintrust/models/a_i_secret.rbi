# typed: strong

module Braintrust
  module Models
    class AISecret < Braintrust::BaseModel
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
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
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
      def preview_secret
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def preview_secret=(_)
      end

      sig { returns(T.nilable(String)) }
      def type
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def type=(_)
      end

      sig { returns(T.nilable(Time)) }
      def updated_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def updated_at=(_)
      end

      sig do
        params(
          id: String,
          name: String,
          org_id: String,
          created: T.nilable(Time),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          preview_secret: T.nilable(String),
          type: T.nilable(String),
          updated_at: T.nilable(Time)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, org_id:, created: nil, metadata: nil, preview_secret: nil, type: nil, updated_at: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              org_id: String,
              created: T.nilable(Time),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              preview_secret: T.nilable(String),
              type: T.nilable(String),
              updated_at: T.nilable(Time)
            }
          )
      end
      def to_hash
      end
    end
  end
end
