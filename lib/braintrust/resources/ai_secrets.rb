# frozen_string_literal: true

module Braintrust
  module Resources
    class AISecrets
      # Create a new ai_secret. If there is an existing ai_secret with the same name as
      #   the one specified in the request, will return the existing ai_secret unmodified
      #
      # @overload create(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      #
      # @param name [String]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param org_name [String, nil]
      # @param secret [String, nil]
      # @param type [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::AISecret]
      #
      # @see Braintrust::Models::AISecretCreateParams
      def create(params)
        parsed, options = Braintrust::Models::AISecretCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/ai_secret",
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # Get an ai_secret object by its id
      #
      # @overload retrieve(ai_secret_id, request_options: {})
      #
      # @param ai_secret_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::AISecret]
      #
      # @see Braintrust::Models::AISecretRetrieveParams
      def retrieve(ai_secret_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/ai_secret/%1$s", ai_secret_id],
          model: Braintrust::Models::AISecret,
          options: params[:request_options]
        )
      end

      # Partially update an ai_secret object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @overload update(ai_secret_id, metadata: nil, name: nil, secret: nil, type: nil, request_options: {})
      #
      # @param ai_secret_id [String]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param name [String, nil]
      # @param secret [String, nil]
      # @param type [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::AISecret]
      #
      # @see Braintrust::Models::AISecretUpdateParams
      def update(ai_secret_id, params = {})
        parsed, options = Braintrust::Models::AISecretUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/ai_secret/%1$s", ai_secret_id],
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # List out all ai_secrets. The ai_secrets are sorted by creation date, with the
      #   most recently-created ai_secrets coming first
      #
      # @overload list(ai_secret_name: nil, ai_secret_type: nil, ending_before: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param ai_secret_name [String]
      # @param ai_secret_type [String, Array<String>]
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::AISecret>]
      #
      # @see Braintrust::Models::AISecretListParams
      def list(params = {})
        parsed, options = Braintrust::Models::AISecretListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/ai_secret",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # Delete an ai_secret object by its id
      #
      # @overload delete(ai_secret_id, request_options: {})
      #
      # @param ai_secret_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::AISecret]
      #
      # @see Braintrust::Models::AISecretDeleteParams
      def delete(ai_secret_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/ai_secret/%1$s", ai_secret_id],
          model: Braintrust::Models::AISecret,
          options: params[:request_options]
        )
      end

      # Delete a single ai_secret
      #
      # @overload find_and_delete(name:, org_name: nil, request_options: {})
      #
      # @param name [String]
      # @param org_name [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::AISecret]
      #
      # @see Braintrust::Models::AISecretFindAndDeleteParams
      def find_and_delete(params)
        parsed, options = Braintrust::Models::AISecretFindAndDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: "v1/ai_secret",
          body: parsed,
          model: Braintrust::Models::AISecret,
          options: options
        )
      end

      # Create or replace ai_secret. If there is an existing ai_secret with the same
      #   name as the one specified in the request, will replace the existing ai_secret
      #   with the provided fields
      #
      # @overload replace(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      #
      # @param name [String]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param org_name [String, nil]
      # @param secret [String, nil]
      # @param type [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::AISecret]
      #
      # @see Braintrust::Models::AISecretReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::AISecretReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/ai_secret",
          body: parsed,
          model: Braintrust::Models::AISecret,
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
