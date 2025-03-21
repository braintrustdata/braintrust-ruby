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
          object_type: Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol,
          value: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def create(
        # The name of the environment variable
        name:,
        # The id of the object the environment variable is scoped for
        object_id_:,
        # The type of the object the environment variable is scoped for
        object_type:,
        # The value of the environment variable. Will be encrypted at rest.
        value: nil,
        request_options: {}
      )
      end

      # Get an env_var object by its id
      sig do
        params(
          env_var_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def retrieve(
        # EnvVar id
        env_var_id,
        request_options: {}
      )
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
      def update(
        # EnvVar id
        env_var_id,
        # The name of the environment variable
        name:,
        # The value of the environment variable. Will be encrypted at rest.
        value: nil,
        request_options: {}
      )
      end

      # List out all env_vars. The env_vars are sorted by creation date, with the most
      #   recently-created env_vars coming first
      sig do
        params(
          env_var_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          object_id_: String,
          object_type: Braintrust::Models::EnvVarObjectType::OrSymbol,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVarListResponse)
      end
      def list(
        # Name of the env_var to search for
        env_var_name: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        #   IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # The id of the object the environment variable is scoped for
        object_id_: nil,
        # The type of the object the environment variable is scoped for
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
      def delete(
        # EnvVar id
        env_var_id,
        request_options: {}
      )
      end

      # Create or replace env_var. If there is an existing env_var with the same name as
      #   the one specified in the request, will replace the existing env_var with the
      #   provided fields
      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::EnvVarReplaceParams::ObjectType::OrSymbol,
          value: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::EnvVar)
      end
      def replace(
        # The name of the environment variable
        name:,
        # The id of the object the environment variable is scoped for
        object_id_:,
        # The type of the object the environment variable is scoped for
        object_type:,
        # The value of the environment variable. Will be encrypted at rest.
        value: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
