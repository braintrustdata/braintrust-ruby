# typed: strong

module Braintrust
  module Models
    class ACL < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def _object_org_id
      end

      sig { params(_: String).returns(String) }
      def _object_org_id=(_)
      end

      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(String)) }
      def group_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def group_id=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def permission
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def permission=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def restrict_object_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def restrict_object_type=(_)
      end

      sig { returns(T.nilable(String)) }
      def role_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def role_id=(_)
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
          _object_org_id: String,
          object_id_: String,
          object_type: Symbol,
          created: T.nilable(Time),
          group_id: T.nilable(String),
          permission: T.nilable(Symbol),
          restrict_object_type: T.nilable(Symbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        _object_org_id:,
        object_id_:,
        object_type:,
        created: nil,
        group_id: nil,
        permission: nil,
        restrict_object_type: nil,
        role_id: nil,
        user_id: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              _object_org_id: String,
              object_id_: String,
              object_type: Symbol,
              created: T.nilable(Time),
              group_id: T.nilable(String),
              permission: T.nilable(Symbol),
              restrict_object_type: T.nilable(Symbol),
              role_id: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
