# frozen_string_literal: true

module Braintrust
  module Resources
    class EnvVars
      # Create a new env_var. If there is an existing env_var with the same name as the
      #   one specified in the request, will return the existing env_var unmodified
      #
      # @overload create(name:, object_id_:, object_type:, value: nil, request_options: {})
      #
      # @param name [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::EnvVarCreateParams::ObjectType]
      # @param value [String, nil]
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
      # @param env_var_id [String]
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
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @overload update(env_var_id, name:, value: nil, request_options: {})
      #
      # @param env_var_id [String]
      # @param name [String]
      # @param value [String, nil]
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

      # List out all env_vars. The env_vars are sorted by creation date, with the most
      #   recently-created env_vars coming first
      #
      # @overload list(env_var_name: nil, ids: nil, limit: nil, object_id_: nil, object_type: nil, request_options: {})
      #
      # @param env_var_name [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::EnvVarObjectType]
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
          query: parsed,
          model: Braintrust::Models::EnvVarListResponse,
          options: options
        )
      end

      # Delete an env_var object by its id
      #
      # @overload delete(env_var_id, request_options: {})
      #
      # @param env_var_id [String]
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
      #   the one specified in the request, will replace the existing env_var with the
      #   provided fields
      #
      # @overload replace(name:, object_id_:, object_type:, value: nil, request_options: {})
      #
      # @param name [String]
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::EnvVarReplaceParams::ObjectType]
      # @param value [String, nil]
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
