# typed: strong

module Braintrust
  module Models
    class EnvVarListResponse < Braintrust::BaseModel
      sig { returns(T::Array[Braintrust::Models::EnvVar]) }
      def objects
      end

      sig { params(_: T::Array[Braintrust::Models::EnvVar]).returns(T::Array[Braintrust::Models::EnvVar]) }
      def objects=(_)
      end

      sig { params(objects: T::Array[Braintrust::Models::EnvVar]).returns(T.attached_class) }
      def self.new(objects:)
      end

      sig { override.returns({objects: T::Array[Braintrust::Models::EnvVar]}) }
      def to_hash
      end
    end
  end
end
