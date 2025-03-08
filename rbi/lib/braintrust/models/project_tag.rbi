# typed: strong

module Braintrust
  module Models
    class ProjectTag < Braintrust::BaseModel
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

      sig { returns(String) }
      def user_id
      end

      sig { params(_: String).returns(String) }
      def user_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def color
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def color=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          user_id: String,
          color: T.nilable(String),
          created: T.nilable(Time),
          description: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, project_id:, user_id:, color: nil, created: nil, description: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              project_id: String,
              user_id: String,
              color: T.nilable(String),
              created: T.nilable(Time),
              description: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
