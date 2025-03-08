# typed: strong

module Braintrust
  module Models
    class Project < Braintrust::BaseModel
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

      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ProjectSettings)) }
      def settings
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ProjectSettings))
          .returns(T.nilable(Braintrust::Models::ProjectSettings))
      end
      def settings=(_)
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
          org_id: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          settings: T.nilable(Braintrust::Models::ProjectSettings),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, org_id:, created: nil, deleted_at: nil, settings: nil, user_id: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              org_id: String,
              created: T.nilable(Time),
              deleted_at: T.nilable(Time),
              settings: T.nilable(Braintrust::Models::ProjectSettings),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
