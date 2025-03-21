# typed: strong

module Braintrust
  module Models
    # The object type that the ACL applies to
    module ACLObjectType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ACLObjectType) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ACLObjectType::TaggedSymbol) }

      ORGANIZATION = T.let(:organization, Braintrust::Models::ACLObjectType::OrSymbol)
      PROJECT = T.let(:project, Braintrust::Models::ACLObjectType::OrSymbol)
      EXPERIMENT = T.let(:experiment, Braintrust::Models::ACLObjectType::OrSymbol)
      DATASET = T.let(:dataset, Braintrust::Models::ACLObjectType::OrSymbol)
      PROMPT = T.let(:prompt, Braintrust::Models::ACLObjectType::OrSymbol)
      PROMPT_SESSION = T.let(:prompt_session, Braintrust::Models::ACLObjectType::OrSymbol)
      GROUP = T.let(:group, Braintrust::Models::ACLObjectType::OrSymbol)
      ROLE = T.let(:role, Braintrust::Models::ACLObjectType::OrSymbol)
      ORG_MEMBER = T.let(:org_member, Braintrust::Models::ACLObjectType::OrSymbol)
      PROJECT_LOG = T.let(:project_log, Braintrust::Models::ACLObjectType::OrSymbol)
      ORG_PROJECT = T.let(:org_project, Braintrust::Models::ACLObjectType::OrSymbol)
    end
  end
end
