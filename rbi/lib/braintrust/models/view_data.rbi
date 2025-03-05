# typed: strong

module Braintrust
  module Models
    class ViewData < Braintrust::BaseModel
      sig { returns(T.nilable(Braintrust::Models::ViewDataSearch)) }
      def search
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ViewDataSearch))
          .returns(T.nilable(Braintrust::Models::ViewDataSearch))
      end
      def search=(_)
      end

      sig { params(search: T.nilable(Braintrust::Models::ViewDataSearch)).void }
      def initialize(search: nil)
      end

      sig { override.returns({search: T.nilable(Braintrust::Models::ViewDataSearch)}) }
      def to_hash
      end
    end
  end
end
