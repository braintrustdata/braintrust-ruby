# typed: strong

module Braintrust
  module Models
    class UserListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def email
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def email=(_)
      end

      sig { returns(T.nilable(String)) }
      def ending_before
      end

      sig { params(_: String).returns(String) }
      def ending_before=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def family_name
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def family_name=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def given_name
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def given_name=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ids
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ids=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: String).returns(String) }
      def org_name=(_)
      end

      sig { returns(T.nilable(String)) }
      def starting_after
      end

      sig { params(_: String).returns(String) }
      def starting_after=(_)
      end

      sig do
        params(
          email: T.any(String, T::Array[String]),
          ending_before: String,
          family_name: T.any(String, T::Array[String]),
          given_name: T.any(String, T::Array[String]),
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
        email: nil,
        ending_before: nil,
        family_name: nil,
        given_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              email: T.any(String, T::Array[String]),
              ending_before: String,
              family_name: T.any(String, T::Array[String]),
              given_name: T.any(String, T::Array[String]),
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              org_name: String,
              starting_after: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Email < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end

      class FamilyName < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end

      class GivenName < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end

      class IDs < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end
    end
  end
end
