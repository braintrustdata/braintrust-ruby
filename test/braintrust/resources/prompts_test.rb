# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::PromptsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response = @braintrust.prompts.create(
      name: "x",
      project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      slug: "x"
    )

    assert_pattern do
      response => Braintrust::Models::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Models::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Models::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.prompts.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Models::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Models::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_update
    response = @braintrust.prompts.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Models::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Models::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    response = @braintrust.prompts.list

    assert_pattern do
      response => Braintrust::ListObjects
    end

    row = response.to_enum.first
    assert_pattern do
      row => Braintrust::Models::Prompt
    end

    assert_pattern do
      row => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Models::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Models::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_delete
    response = @braintrust.prompts.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Models::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Models::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_replace_required_params
    response = @braintrust.prompts.replace(
      name: "x",
      project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
      slug: "x"
    )

    assert_pattern do
      response => Braintrust::Models::Prompt
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        log_id: Braintrust::Models::Prompt::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_type: Braintrust::Models::Prompt::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end
end
