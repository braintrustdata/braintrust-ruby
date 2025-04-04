# typed: strong

module Braintrust
  module Models
    class ViewData < Braintrust::Internal::Type::BaseModel
      sig { returns(T.nilable(Braintrust::Models::ViewDataSearch)) }
      attr_reader :search

      sig { params(search: T.nilable(T.any(Braintrust::Models::ViewDataSearch, Braintrust::Internal::AnyHash))).void }
      attr_writer :search

      # The view definition
      sig do
        params(search: T.nilable(T.any(Braintrust::Models::ViewDataSearch, Braintrust::Internal::AnyHash)))
          .returns(T.attached_class)
      end
      def self.new(search: nil)
      end

      sig { override.returns({search: T.nilable(Braintrust::Models::ViewDataSearch)}) }
      def to_hash
      end
    end
  end
end
