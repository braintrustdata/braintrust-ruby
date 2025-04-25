# frozen_string_literal: true

module Braintrust
  module Resources
    class EnvVars
      # Create a new env_var. If there is an existing env_var with the same name as the
      # one specified in the request, will return the existing env_var unmodified
      #
      # @overload create(name:, object_id_:, object_type:, value: nil, request_options: {})
      #
      # @param name [String] The name of the environment variable
      #
      # @param object_id_ [String] The id of the object the environment variable is scoped for
      #
      # @param object_type [Symbol, Braintrust::Models::EnvVarCreateParams::ObjectType] The type of the object the environment variable is scoped for
      #
      # @param value [String, nil] The value of the environment variable. Will be encrypted at rest.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::EnvVar]
      #
      # @see Braintrust::Models::EnvVarCreateParams
      def create(params)
        parsed, options = Braintrust::Models::EnvVarCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/env_var",
          body: parsed,
          model: Braintrust::Models::EnvVar,
          options: options
        )
      end

      # Get an env_var object by its id
      #
      # @overload retrieve(env_var_id, request_options: {})
      #
      # @param env_var_id [String] EnvVar id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::EnvVar]
      #
      # @see Braintrust::Models::EnvVarRetrieveParams
      def retrieve(env_var_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/env_var/%1$s", env_var_id],
          model: Braintrust::Models::EnvVar,
          options: params[:request_options]
        )
      end

      # Partially update an env_var object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      #
      # @overload update(env_var_id, name:, value: nil, request_options: {})
      #
      # @param env_var_id [String] EnvVar id
      #
      # @param name [String] The name of the environment variable
      #
      # @param value [String, nil] The value of the environment variable. Will be encrypted at rest.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::EnvVar]
      #
      # @see Braintrust::Models::EnvVarUpdateParams
      def update(env_var_id, params)
        parsed, options = Braintrust::Models::EnvVarUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/env_var/%1$s", env_var_id],
          body: parsed,
          model: Braintrust::Models::EnvVar,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::EnvVarListParams} for more details.
      #
      # List out all env_vars. The env_vars are sorted by creation date, with the most
      # recently-created env_vars coming first
      #
      # @overload list(env_var_name: nil, ids: nil, limit: nil, object_id_: nil, object_type: nil, request_options: {})
      #
      # @param env_var_name [String] Name of the env_var to search for
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      # ...
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param object_id_ [String] The id of the object the environment variable is scoped for
      #
      # @param object_type [Symbol, Braintrust::Models::EnvVarObjectType] The type of the object the environment variable is scoped for
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::EnvVarListResponse]
      #
      # @see Braintrust::Models::EnvVarListParams
      def list(params = {})
        parsed, options = Braintrust::Models::EnvVarListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/env_var",
          query: parsed.transform_keys(object_id_: "object_id"),
          model: Braintrust::Models::EnvVarListResponse,
          options: options
        )
      end

      # Delete an env_var object by its id
      #
      # @overload delete(env_var_id, request_options: {})
      #
      # @param env_var_id [String] EnvVar id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::EnvVar]
      #
      # @see Braintrust::Models::EnvVarDeleteParams
      def delete(env_var_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/env_var/%1$s", env_var_id],
          model: Braintrust::Models::EnvVar,
          options: params[:request_options]
        )
      end

      # Create or replace env_var. If there is an existing env_var with the same name as
      # the one specified in the request, will replace the existing env_var with the
      # provided fields
      #
      # @overload replace(name:, object_id_:, object_type:, value: nil, request_options: {})
      #
      # @param name [String] The name of the environment variable
      #
      # @param object_id_ [String] The id of the object the environment variable is scoped for
      #
      # @param object_type [Symbol, Braintrust::Models::EnvVarReplaceParams::ObjectType] The type of the object the environment variable is scoped for
      #
      # @param value [String, nil] The value of the environment variable. Will be encrypted at rest.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::EnvVar]
      #
      # @see Braintrust::Models::EnvVarReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::EnvVarReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/env_var",
          body: parsed,
          model: Braintrust::Models::EnvVar,
          options: options
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
