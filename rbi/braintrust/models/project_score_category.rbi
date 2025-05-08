# typed: strong

module Braintrust
  module Models
    class ProjectScoreCategory < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Name of the category
      sig { returns(String) }
      attr_accessor :name

      # Numerical value of the category. Must be between 0 and 1, inclusive
      sig { returns(Float) }
      attr_accessor :value

      # For categorical-type project scores, defines a single category
      sig { params(name: String, value: Float).returns(T.attached_class) }
      def self.new(
        # Name of the category
        name:,
        # Numerical value of the category. Must be between 0 and 1, inclusive
        value:
      )
      end

      sig { override.returns({ name: String, value: Float }) }
      def to_hash
      end
    end
  end
end
