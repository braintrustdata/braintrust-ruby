# typed: strong

module Braintrust
  module Models
    class ACLBatchUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL])) }
      def add_acls
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]))
          .returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]))
      end
      def add_acls=(_)
      end

      sig { returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL])) }
      def remove_acls
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]))
          .returns(T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]))
      end
      def remove_acls=(_)
      end

      sig do
        params(
          add_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]),
          remove_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(add_acls: nil, remove_acls: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              add_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]),
              remove_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class AddACL < Braintrust::BaseModel
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
            user_id: T.nilable(String)
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
          user_id: nil
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
                user_id: T.nilable(String)
              }
            )
        end
        def to_hash
        end
      end

      class RemoveACL < Braintrust::BaseModel
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
            user_id: T.nilable(String)
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
          user_id: nil
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
                user_id: T.nilable(String)
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
