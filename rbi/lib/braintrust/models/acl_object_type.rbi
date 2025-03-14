# typed: strong

module Braintrust
  module Models
    class ACLObjectType < Braintrust::Enum
      abstract!

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

      class << self
        sig { override.returns(T::Array[Symbol]) }
        def values
        end
      end
    end
  end
end
