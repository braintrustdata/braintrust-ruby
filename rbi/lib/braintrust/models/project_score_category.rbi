# typed: strong

module Braintrust
  module Models
    class ProjectScoreCategory < Braintrust::BaseModel
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(Float) }
      def value
      end

      sig { params(_: Float).returns(Float) }
      def value=(_)
      end

      sig { params(name: String, value: Float).void }
      def initialize(name:, value:)
      end

      sig { override.returns({name: String, value: Float}) }
      def to_hash
      end
    end
  end
end
