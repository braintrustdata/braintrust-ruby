# typed: strong

module Braintrust
  module Models
    class EnvVarListResponse < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Braintrust::Models::EnvVarListResponse,
            Braintrust::Internal::AnyHash
          )
        end

      # A list of env_var objects
      sig { returns(T::Array[Braintrust::EnvVar]) }
      attr_accessor :objects

      sig do
        params(objects: T::Array[Braintrust::EnvVar::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(
        # A list of env_var objects
        objects:
      )
      end

      sig { override.returns({ objects: T::Array[Braintrust::EnvVar] }) }
      def to_hash
      end
    end
  end
end
