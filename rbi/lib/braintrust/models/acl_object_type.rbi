# typed: strong

module Braintrust
  module Models
    # The object type that the ACL applies to
    module ACLObjectType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ACLObjectType) }
      OrSymbol = T.type_alias { T.any(Symbol, String, Braintrust::Models::ACLObjectType::TaggedSymbol) }

      ORGANIZATION = T.let(:organization, Braintrust::Models::ACLObjectType::TaggedSymbol)
      PROJECT = T.let(:project, Braintrust::Models::ACLObjectType::TaggedSymbol)
      EXPERIMENT = T.let(:experiment, Braintrust::Models::ACLObjectType::TaggedSymbol)
      DATASET = T.let(:dataset, Braintrust::Models::ACLObjectType::TaggedSymbol)
      PROMPT = T.let(:prompt, Braintrust::Models::ACLObjectType::TaggedSymbol)
      PROMPT_SESSION = T.let(:prompt_session, Braintrust::Models::ACLObjectType::TaggedSymbol)
      GROUP = T.let(:group, Braintrust::Models::ACLObjectType::TaggedSymbol)
      ROLE = T.let(:role, Braintrust::Models::ACLObjectType::TaggedSymbol)
      ORG_MEMBER = T.let(:org_member, Braintrust::Models::ACLObjectType::TaggedSymbol)
      PROJECT_LOG = T.let(:project_log, Braintrust::Models::ACLObjectType::TaggedSymbol)
      ORG_PROJECT = T.let(:org_project, Braintrust::Models::ACLObjectType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::Models::ACLObjectType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
