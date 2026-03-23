# typed: strong

module Braintrust
  module Models
    class ViewData < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::ViewData, Braintrust::Internal::AnyHash)
        end

      sig { returns(T.nilable(Braintrust::ViewDataSearch)) }
      attr_reader :search

      sig { params(search: T.nilable(Braintrust::ViewDataSearch::OrHash)).void }
      attr_writer :search

      # The view definition
      sig do
        params(search: T.nilable(Braintrust::ViewDataSearch::OrHash)).returns(
          T.attached_class
        )
      end
      def self.new(search: nil)
      end

      sig do
        override.returns({ search: T.nilable(Braintrust::ViewDataSearch) })
      end
      def to_hash
      end
    end
  end
end
