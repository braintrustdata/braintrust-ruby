# frozen_string_literal: true

module Braintrust
  module Resources
    class EnvVars
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new env_var. If there is an existing env_var with the same name as the
      #   one specified in the request, will return the existing env_var unmodified
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String] :name The name of the environment variable
      #   @option params [String] :object_id The id of the object the environment variable is scoped for
      #   @option params [Symbol, ObjectType] :object_type The type of the object the environment variable is scoped for
      #   @option params [String, nil] :value The value of the environment variable. Will be encrypted at rest.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::EnvVar]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/env_var",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::EnvVar
        }
        @client.request(req, opts)
      end

      # Get an env_var object by its id
      #
      # @param env_var_id [String] EnvVar id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::EnvVar]
      def retrieve(env_var_id, opts = {})
        req = {
          method: :get,
          path: "/v1/env_var/#{env_var_id}",
          model: Braintrust::Models::EnvVar
        }
        @client.request(req, opts)
      end

      # Partially update an env_var object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param env_var_id [String] EnvVar id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String] :name The name of the environment variable
      #   @option params [String, nil] :value The value of the environment variable. Will be encrypted at rest.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::EnvVar]
      def update(env_var_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/env_var/#{env_var_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::EnvVar
        }
        @client.request(req, opts)
      end

      # List out all env_vars. The env_vars are sorted by creation date, with the most
      #   recently-created env_vars coming first
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :env_var_name Name of the env_var to search for
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :object_id The id of the object the environment variable is scoped for
      #   @option params [Symbol, ObjectType, nil] :object_type The type of the object the environment variable is scoped for
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::EnvVarListResponse]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/env_var",
          query: params,
          model: Braintrust::Models::EnvVarListResponse
        }
        @client.request(req, opts)
      end

      # Delete an env_var object by its id
      #
      # @param env_var_id [String] EnvVar id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::EnvVar]
      def delete(env_var_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/env_var/#{env_var_id}",
          model: Braintrust::Models::EnvVar
        }
        @client.request(req, opts)
      end

      # Create or replace env_var. If there is an existing env_var with the same name as
      #   the one specified in the request, will replace the existing env_var with the
      #   provided fields
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String] :name The name of the environment variable
      #   @option params [String] :object_id The id of the object the environment variable is scoped for
      #   @option params [Symbol, ObjectType] :object_type The type of the object the environment variable is scoped for
      #   @option params [String, nil] :value The value of the environment variable. Will be encrypted at rest.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::EnvVar]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/env_var",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::EnvVar
        }
        @client.request(req, opts)
      end
    end
  end
end
