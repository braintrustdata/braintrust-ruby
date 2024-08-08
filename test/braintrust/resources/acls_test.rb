# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ACLsTest < Test::Unit::TestCase
  def setup
    @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
  end

  def test_create_required_params
    response = @braintrust.acls.create(
      {
        object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: "organization"
      }
    )
    assert_kind_of(Braintrust::Models::ACL, response)
  end

  def test_retrieve
    response = @braintrust.acls.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ACL, response)
  end

  def test_list_required_params
    response = @braintrust.acls.list(
      {
        object_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        object_type: "organization"
      }
    )
    assert_kind_of(Braintrust::ListObjects, response)
  end

  def test_delete
    response = @braintrust.acls.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
    assert_kind_of(Braintrust::Models::ACL, response)
  end
end
