# typed: strong

module Braintrust
  module Models
    # The object type that the ACL applies to
    module ACLObjectType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::ACLObjectType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ORGANIZATION =
        T.let(:organization, Braintrust::ACLObjectType::TaggedSymbol)
      PROJECT = T.let(:project, Braintrust::ACLObjectType::TaggedSymbol)
      EXPERIMENT = T.let(:experiment, Braintrust::ACLObjectType::TaggedSymbol)
      DATASET = T.let(:dataset, Braintrust::ACLObjectType::TaggedSymbol)
      PROMPT = T.let(:prompt, Braintrust::ACLObjectType::TaggedSymbol)
      PROMPT_SESSION =
        T.let(:prompt_session, Braintrust::ACLObjectType::TaggedSymbol)
      GROUP = T.let(:group, Braintrust::ACLObjectType::TaggedSymbol)
      ROLE = T.let(:role, Braintrust::ACLObjectType::TaggedSymbol)
      ORG_MEMBER = T.let(:org_member, Braintrust::ACLObjectType::TaggedSymbol)
      PROJECT_LOG = T.let(:project_log, Braintrust::ACLObjectType::TaggedSymbol)
      ORG_PROJECT = T.let(:org_project, Braintrust::ACLObjectType::TaggedSymbol)

      sig do
        override.returns(T::Array[Braintrust::ACLObjectType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
