# typed: strong

module Braintrust
  module Models
    class ACLCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
          object_id_: String,
          object_type: Symbol,
          group_id: T.nilable(String),
          permission: T.nilable(Symbol),
          restrict_object_type: T.nilable(Symbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        object_id_:,
        object_type:,
        group_id: nil,
        permission: nil,
        restrict_object_type: nil,
        role_id: nil,
        user_id: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              object_id_: String,
              object_type: Symbol,
              group_id: T.nilable(String),
              permission: T.nilable(Symbol),
              restrict_object_type: T.nilable(Symbol),
              role_id: T.nilable(String),
              user_id: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
