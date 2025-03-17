# typed: strong

module Braintrust
  module Models
    # The object type that the ACL applies to
    class ACLObjectType < Braintrust::Enum
      abstract!

      Value = type_template(:out) { {fixed: Symbol} }

      ORGANIZATION = :organization
      PROJECT = :project
      EXPERIMENT = :experiment
      DATASET = :dataset
      PROMPT = :prompt
      PROMPT_SESSION = :prompt_session
      GROUP = :group
      ROLE = :role
      ORG_MEMBER = :org_member
      PROJECT_LOG = :project_log
      ORG_PROJECT = :org_project
    end
  end
end
