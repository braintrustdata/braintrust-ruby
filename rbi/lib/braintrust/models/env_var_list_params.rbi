# typed: strong

module Braintrust
  module Models
    class EnvVarListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the env_var to search for
      sig { returns(T.nilable(String)) }
      def env_var_name
      end

      sig { params(_: String).returns(String) }
      def env_var_name=(_)
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ids
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ids=(_)
      end

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      # The id of the object the environment variable is scoped for
      sig { returns(T.nilable(String)) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The type of the object the environment variable is scoped for
      sig { returns(T.nilable(Braintrust::Models::EnvVarObjectType::OrSymbol)) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::EnvVarObjectType::OrSymbol)
          .returns(Braintrust::Models::EnvVarObjectType::OrSymbol)
      end
      def object_type=(_)
      end

      sig do
        params(
          env_var_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          object_id_: String,
          object_type: Braintrust::Models::EnvVarObjectType::OrSymbol,
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(env_var_name: nil, ids: nil, limit: nil, object_id_: nil, object_type: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              env_var_name: String,
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              object_id_: String,
              object_type: Braintrust::Models::EnvVarObjectType::OrSymbol,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      module IDs
        extend Braintrust::Union

        Variants = type_template(:out) { {fixed: T.any(String, T::Array[String])} }

        StringArray = T.let(Braintrust::ArrayOf[String], Braintrust::Converter)

        class << self
          sig { override.returns([String, T::Array[String]]) }
          def variants
          end
        end
      end
    end
  end
end
