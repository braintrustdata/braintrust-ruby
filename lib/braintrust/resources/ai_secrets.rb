# frozen_string_literal: true

module Braintrust
  module Resources
    class AISecrets
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new ai_secret. If there is an existing ai_secret with the same name as
      #   the one specified in the request, will return the existing ai_secret unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the AI secret
      #   @option params [Hash, nil] :metadata
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #   @option params [String, nil] :secret Secret value. If omitted in a PUT request, the existing secret value will be
      #     left intact, not replaced with null.
      #   @option params [String, nil] :type
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::AISecret]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/ai_secret",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end

      # Get an ai_secret object by its id
      #
      # @param ai_secret_id [String] AiSecret id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::AISecret]
      def retrieve(ai_secret_id, opts = {})
        req = {
          method: :get,
          path: "/v1/ai_secret/#{ai_secret_id}",
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end

      # Partially update an ai_secret object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param ai_secret_id [String] AiSecret id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Hash, nil] :metadata
      #   @option params [String, nil] :name Name of the AI secret
      #   @option params [String, nil] :secret
      #   @option params [String, nil] :type
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::AISecret]
      def update(ai_secret_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/ai_secret/#{ai_secret_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end

      # List out all ai_secrets. The ai_secrets are sorted by creation date, with the
      #   most recently-created ai_secrets coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :ai_secret_name Name of the ai_secret to search for
      #   @option params [Array<String>, String, nil] :ai_secret_type
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::AISecret>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/ai_secret",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end

      # Delete an ai_secret object by its id
      #
      # @param ai_secret_id [String] AiSecret id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::AISecret]
      def delete(ai_secret_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/ai_secret/#{ai_secret_id}",
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end

      # Delete a single ai_secret
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the AI secret
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::AISecret]
      def find_and_delete(params = {}, opts = {})
        req = {
          method: :delete,
          path: "/v1/ai_secret",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end

      # Create or replace ai_secret. If there is an existing ai_secret with the same
      #   name as the one specified in the request, will replace the existing ai_secret
      #   with the provided fields
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the AI secret
      #   @option params [Hash, nil] :metadata
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #   @option params [String, nil] :secret Secret value. If omitted in a PUT request, the existing secret value will be
      #     left intact, not replaced with null.
      #   @option params [String, nil] :type
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::AISecret]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/ai_secret",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::AISecret
        }
        @client.request(req, opts)
      end
    end
  end
end
