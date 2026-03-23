# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::PromptsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.prompts.create(name: "x", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "x")

    assert_pattern do
      response => Braintrust::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        prompt_data: Braintrust::PromptData | nil,
        tags: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.prompts.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        prompt_data: Braintrust::PromptData | nil,
        tags: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_update
    response = @braintrust.prompts.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        prompt_data: Braintrust::PromptData | nil,
        tags: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    response = @braintrust.prompts.list

    assert_pattern do
      response => Braintrust::Internal::ListObjects
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Braintrust::Prompt
    end

    assert_pattern do
      row => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        prompt_data: Braintrust::PromptData | nil,
        tags: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_delete
    response = @braintrust.prompts.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        prompt_data: Braintrust::PromptData | nil,
        tags: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_replace_required_params
    response =
      @braintrust.prompts.replace(name: "x", project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", slug: "x")

    assert_pattern do
      response => Braintrust::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                       nil?: true]) | nil,
        prompt_data: Braintrust::PromptData | nil,
        tags: ^(Braintrust::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end
end
