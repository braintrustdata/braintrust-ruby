# frozen_string_literal: true

module Braintrust
  module Resources
    class Project
          attr_reader :logs

          def initialize(client:)
              @client = client
              @logs = Braintrust::Resources::Project::Logs.new(client: client)
          end

          # Create a new project. If there is an existing project with the same name as the
          #   one specified in the request, will return the existing project unmodified
          # 
          # @param params [Hash] Attributes to send in this request.
          # @option params [String] :name Name of the project
          # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
          #   that your API key belongs to multiple organizations, you may specify the name of
          #   the organization the project belongs in.
          # 
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Braintrust::Models::Project]
          def create(params = {}, opts = {})
              req = {}
              req[:method] = :post
              req[:path] = "/v1/project"
              req[:body] = params
              req[:model] = Braintrust::Models::Project
              @client.request(req, opts)
          end

          # Get a project object by its id
          # 
          # @param project_id [String] Project id
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Braintrust::Models::Project]
          def retrieve(project_id, opts = {})
              req = {}
              req[:method] = :get
              req[:path] = "/v1/project/#{project_id}"
              req[:model] = Braintrust::Models::Project
              @client.request(req, opts)
          end

          # Partially update a project object. Specify the fields to update in the payload.
          #   Any object-type fields will be deep-merged with existing content. Currently we
          #   do not support removing fields or setting them to null. As a workaround, you may
          #   retrieve the full object with `GET /project/{id}` and then replace it with
          #   `PUT /project`.
          # 
          # @param project_id [String] Project id
          # 
          # @param params [Hash] Attributes to send in this request.
          # @option params [String] :name Name of the project
          # 
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Braintrust::Models::Project]
          def update(project_id, params = {}, opts = {})
              req = {}
              req[:method] = :patch
              req[:path] = "/v1/project/#{project_id}"
              req[:body] = params
              req[:model] = Braintrust::Models::Project
              @client.request(req, opts)
          end

          # Delete a project object by its id
          # 
          # @param project_id [String] Project id
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Braintrust::Models::Project]
          def delete(project_id, opts = {})
              req = {}
              req[:method] = :delete
              req[:path] = "/v1/project/#{project_id}"
              req[:model] = Braintrust::Models::Project
              @client.request(req, opts)
          end

          # Create or replace a new project. If there is an existing project with the same
          #   name as the one specified in the request, will replace the existing project with
          #   the provided fields
          # 
          # @param params [Hash] Attributes to send in this request.
          # @option params [String] :name Name of the project
          # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
          #   that your API key belongs to multiple organizations, you may specify the name of
          #   the organization the project belongs in.
          # 
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [Braintrust::Models::Project]
          def replace(params = {}, opts = {})
              req = {}
              req[:method] = :put
              req[:path] = "/v1/project"
              req[:body] = params
              req[:model] = Braintrust::Models::Project
              @client.request(req, opts)
          end
    end
  end
end
