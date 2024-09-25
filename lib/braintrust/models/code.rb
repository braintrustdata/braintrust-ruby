# frozen_string_literal: true

module Braintrust
  module Models
    class Code < BaseModel
      # @!attribute [rw] data
      #   @return [Braintrust::Models::Code::Data::UnnamedTypeWithunionParent0|Braintrust::Models::Code::Data::UnnamedTypeWithunionParent1]
      required :data, Braintrust::Unknown

      # @!attribute [rw] type
      #   One of the constants defined in {Braintrust::Models::Code::Type}
      #   @return [Symbol]
      required :type, enum: -> { Braintrust::Models::Code::Type }

      class Type < Braintrust::Enum
        CODE = :code
      end
    end
  end
end
