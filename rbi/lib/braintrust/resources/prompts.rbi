# typed: strong

module Braintrust
  module Resources
    class Prompts
      sig do
        params(
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_type: T.nilable(Symbol),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Prompt)
      end
      def create(
        name:,
        project_id:,
        slug:,
        description: nil,
        function_type: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      sig do
        params(
          prompt_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Prompt)
      end
      def retrieve(prompt_id, request_options: {})
      end

      sig do
        params(
          prompt_id: String,
          description: T.nilable(String),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          slug: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Prompt)
      end
      def update(
        prompt_id,
        description: nil,
        name: nil,
        prompt_data: nil,
        slug: nil,
        tags: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          prompt_name: String,
          slug: String,
          starting_after: String,
          version: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Prompt])
      end
      def list(
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        prompt_name: nil,
        slug: nil,
        starting_after: nil,
        version: nil,
        request_options: {}
      )
      end

      sig do
        params(
          prompt_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Prompt)
      end
      def delete(prompt_id, request_options: {})
      end

      sig do
        params(
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_type: T.nilable(Symbol),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Prompt)
      end
      def replace(
        name:,
        project_id:,
        slug:,
        description: nil,
        function_type: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
