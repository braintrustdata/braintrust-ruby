# frozen_string_literal: true

module Braintrust
  module Models
    # The object type that the ACL applies to
    module ACLObjectType
      extend Braintrust::Enum

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

      finalize!

      # @!parse
      #   # @return [Array<Symbol>]
      #   def self.values; end
    end
  end
end
