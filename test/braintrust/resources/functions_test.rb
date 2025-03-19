# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::FunctionsTest < Braintrust::Test::ResourceTest
  def test_create_required_params
    response =
      @braintrust.functions.create(
        function_data: {type: :prompt},
        name: "x",
        project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        slug: "x"
      )

    assert_pattern do
      response => Braintrust::Models::Function
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        function_data: Braintrust::Models::Function::FunctionData,
        log_id: Braintrust::Models::Function::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_schema: Braintrust::Models::Function::FunctionSchema | nil,
        function_type: Braintrust::Models::Function::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        origin: Braintrust::Models::Function::Origin | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_retrieve
    response = @braintrust.functions.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Function
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        function_data: Braintrust::Models::Function::FunctionData,
        log_id: Braintrust::Models::Function::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_schema: Braintrust::Models::Function::FunctionSchema | nil,
        function_type: Braintrust::Models::Function::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        origin: Braintrust::Models::Function::Origin | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_update
    response = @braintrust.functions.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Function
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        function_data: Braintrust::Models::Function::FunctionData,
        log_id: Braintrust::Models::Function::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_schema: Braintrust::Models::Function::FunctionSchema | nil,
        function_type: Braintrust::Models::Function::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        origin: Braintrust::Models::Function::Origin | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_list
    response = @braintrust.functions.list

    assert_pattern do
      response => Braintrust::ListObjects
    end

    row = response.to_enum.first
    assert_pattern do
      row => Braintrust::Models::Function
    end

    assert_pattern do
      row => {
        id: String,
        _xact_id: String,
        function_data: Braintrust::Models::Function::FunctionData,
        log_id: Braintrust::Models::Function::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_schema: Braintrust::Models::Function::FunctionSchema | nil,
        function_type: Braintrust::Models::Function::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        origin: Braintrust::Models::Function::Origin | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_delete
    response = @braintrust.functions.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Models::Function
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        function_data: Braintrust::Models::Function::FunctionData,
        log_id: Braintrust::Models::Function::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_schema: Braintrust::Models::Function::FunctionSchema | nil,
        function_type: Braintrust::Models::Function::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        origin: Braintrust::Models::Function::Origin | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end

  def test_invoke
    response = @braintrust.functions.invoke("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Braintrust::Unknown
    end
  end

  def test_replace_required_params
    response =
      @braintrust.functions.replace(
        function_data: {type: :prompt},
        name: "x",
        project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        slug: "x"
      )

    assert_pattern do
      response => Braintrust::Models::Function
    end

    assert_pattern do
      response => {
        id: String,
        _xact_id: String,
        function_data: Braintrust::Models::Function::FunctionData,
        log_id: Braintrust::Models::Function::LogID,
        name: String,
        org_id: String,
        project_id: String,
        slug: String,
        created: Time | nil,
        description: String | nil,
        function_schema: Braintrust::Models::Function::FunctionSchema | nil,
        function_type: Braintrust::Models::Function::FunctionType | nil,
        metadata: ^(Braintrust::HashOf[Braintrust::Unknown, nil?: true]) | nil,
        origin: Braintrust::Models::Function::Origin | nil,
        prompt_data: Braintrust::Models::PromptData | nil,
        tags: ^(Braintrust::ArrayOf[String]) | nil
      }
    end
  end
end
