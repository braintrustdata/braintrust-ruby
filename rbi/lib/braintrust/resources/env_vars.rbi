# typed: strong

module Braintrust
  module Resources
    class EnvVars
      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Symbol,
          value: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def create(name:, object_id_:, object_type:, value: nil, request_options: {})
      end

      sig do
        params(
          env_var_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def retrieve(env_var_id, request_options: {})
      end

      sig do
        params(
          env_var_id: String,
          name: String,
          value: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def update(env_var_id, name:, value: nil, request_options: {})
      end

      sig do
        params(
          env_var_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          object_id_: String,
          object_type: Symbol,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVarListResponse)
      end
      def list(
        env_var_name: nil,
        ids: nil,
        limit: nil,
        object_id_: nil,
        object_type: nil,
        request_options: {}
      )
      end

      sig do
        params(
          env_var_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def delete(env_var_id, request_options: {})
      end

      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Symbol,
          value: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def replace(name:, object_id_:, object_type:, value: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
