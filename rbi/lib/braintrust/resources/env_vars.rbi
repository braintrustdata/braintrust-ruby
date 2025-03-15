# typed: strong

module Braintrust
  module Resources
    class EnvVars
      # Create a new env_var. If there is an existing env_var with the same name as the
      #   one specified in the request, will return the existing env_var unmodified
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

      # Get an env_var object by its id
      sig do
        params(
          env_var_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def retrieve(env_var_id, request_options: {})
      end

      # Partially update an env_var object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
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

      # List out all env_vars. The env_vars are sorted by creation date, with the most
      #   recently-created env_vars coming first
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

      # Delete an env_var object by its id
      sig do
        params(
          env_var_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def delete(env_var_id, request_options: {})
      end

      # Create or replace env_var. If there is an existing env_var with the same name as
      #   the one specified in the request, will replace the existing env_var with the
      #   provided fields
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

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
