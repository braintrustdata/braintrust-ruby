# typed: strong

module Braintrust
  module Models
    class ProjectScoreConfig < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_accessor :destination

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :multi_select

      sig { returns(T.nilable(Braintrust::OnlineScoreConfig)) }
      attr_reader :online

      sig do
        params(online: T.nilable(Braintrust::OnlineScoreConfig::OrHash)).void
      end
      attr_writer :online

      sig do
        params(
          destination: T.nilable(String),
          multi_select: T.nilable(T::Boolean),
          online: T.nilable(Braintrust::OnlineScoreConfig::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(destination: nil, multi_select: nil, online: nil)
      end

      sig do
        override.returns(
          {
            destination: T.nilable(String),
            multi_select: T.nilable(T::Boolean),
            online: T.nilable(Braintrust::OnlineScoreConfig)
          }
        )
      end
      def to_hash
      end
    end
  end
end
