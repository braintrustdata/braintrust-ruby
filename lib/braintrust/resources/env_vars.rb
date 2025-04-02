# frozen_string_literal: true

module Braintrust
  module Resources
    class EnvVars
      # Create a new env_var. If there is an existing env_var with the same name as the
      #   one specified in the request, will return the existing env_var unmodified
      #
      # @param params [Braintrust::Models::EnvVarCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name The name of the environment variable
      #
      #   @option params [String] :object_id_ The id of the object the environment variable is scoped for
      #
      #   @option params [Symbol, Braintrust::Models::EnvVarCreateParams::ObjectType] :object_type The type of the object the environment variable is scoped for
      #
      #   @option params [String, nil] :value The value of the environment variable. Will be encrypted at rest.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::EnvVar]
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
      # @param env_var_id [String] EnvVar id
      #
      # @param params [Braintrust::Models::EnvVarRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::EnvVar]
      def retrieve(env_var_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/env_var/%1$s", env_var_id],
          model: Braintrust::Models::EnvVar,
          options: params[:request_options]
        )
      end

      # Partially update an env_var object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param env_var_id [String] EnvVar id
      #
      # @param params [Braintrust::Models::EnvVarUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name The name of the environment variable
      #
      #   @option params [String, nil] :value The value of the environment variable. Will be encrypted at rest.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::EnvVar]
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

      # List out all env_vars. The env_vars are sorted by creation date, with the most
      #   recently-created env_vars coming first
      #
      # @param params [Braintrust::Models::EnvVarListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :env_var_name Name of the env_var to search for
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :object_id_ The id of the object the environment variable is scoped for
      #
      #   @option params [Symbol, Braintrust::Models::EnvVarObjectType] :object_type The type of the object the environment variable is scoped for
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::EnvVarListResponse]
      def list(params = {})
        parsed, options = Braintrust::Models::EnvVarListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/env_var",
          query: parsed,
          model: Braintrust::Models::EnvVarListResponse,
          options: options
        )
      end

      # Delete an env_var object by its id
      #
      # @param env_var_id [String] EnvVar id
      #
      # @param params [Braintrust::Models::EnvVarDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::EnvVar]
      def delete(env_var_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/env_var/%1$s", env_var_id],
          model: Braintrust::Models::EnvVar,
          options: params[:request_options]
        )
      end

      # Create or replace env_var. If there is an existing env_var with the same name as
      #   the one specified in the request, will replace the existing env_var with the
      #   provided fields
      #
      # @param params [Braintrust::Models::EnvVarReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name The name of the environment variable
      #
      #   @option params [String] :object_id_ The id of the object the environment variable is scoped for
      #
      #   @option params [Symbol, Braintrust::Models::EnvVarReplaceParams::ObjectType] :object_type The type of the object the environment variable is scoped for
      #
      #   @option params [String, nil] :value The value of the environment variable. Will be encrypted at rest.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::EnvVar]
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

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
