# typed: strong

module Braintrust
  module Models
    class EnvVarListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Name of the env_var to search for
      sig { returns(T.nilable(String)) }
      attr_reader :env_var_name

      sig { params(env_var_name: String).void }
      attr_writer :env_var_name

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      attr_reader :ids

      sig { params(ids: T.any(String, T::Array[String])).void }
      attr_writer :ids

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # The id of the object the environment variable is scoped for
      sig { returns(T.nilable(String)) }
      attr_reader :object_id_

      sig { params(object_id_: String).void }
      attr_writer :object_id_

      # The type of the object the environment variable is scoped for
      sig { returns(T.nilable(Braintrust::Models::EnvVarObjectType::OrSymbol)) }
      attr_reader :object_type

      sig { params(object_type: Braintrust::Models::EnvVarObjectType::OrSymbol).void }
      attr_writer :object_type

      sig do
        params(
          env_var_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          object_id_: String,
          object_type: Braintrust::Models::EnvVarObjectType::OrSymbol,
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Name of the env_var to search for
        env_var_name: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # The id of the object the environment variable is scoped for
        object_id_: nil,
        # The type of the object the environment variable is scoped for
        object_type: nil,
        request_options: {}
      ); end
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
      def to_hash; end

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        sig { override.returns([String, T::Array[String]]) }
        def self.variants; end

        StringArray = T.let(
          Braintrust::Internal::Type::ArrayOf[String],
          Braintrust::Internal::Type::Converter
        )
      end
    end
  end
end
