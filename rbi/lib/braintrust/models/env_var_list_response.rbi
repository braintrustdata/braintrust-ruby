# typed: strong

module Braintrust
  module Models
    class EnvVarListResponse < Braintrust::BaseModel
      # A list of env_var objects
      sig { returns(T::Array[Braintrust::Models::EnvVar]) }
      attr_accessor :objects

      sig do
        params(objects: T::Array[T.any(Braintrust::Models::EnvVar, Braintrust::Internal::Util::AnyHash)])
          .returns(T.attached_class)
      end
      def self.new(objects:)
      end

      sig { override.returns({objects: T::Array[Braintrust::Models::EnvVar]}) }
      def to_hash
      end
    end
  end
end
