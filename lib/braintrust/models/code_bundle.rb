# frozen_string_literal: true

module Braintrust
  module Models
    class CodeBundle < BaseModel
      # @!attribute [rw] bundle_id
      #   @return [String]
      required :bundle_id, String

      # @!attribute [rw] location
      #   @return [Braintrust::Models::CodeBundle::Location::UnnamedTypeWithunionParent0|Braintrust::Models::CodeBundle::Location::UnnamedTypeWithunionParent1]
      required :location, Braintrust::Unknown

      # @!attribute [rw] runtime_context
      #   @return [Braintrust::Models::CodeBundle::RuntimeContext]
      required :runtime_context, -> { Braintrust::Models::CodeBundle::RuntimeContext }

      # @!attribute [rw] preview
      #   A preview of the code
      #   @return [String]
      optional :preview, String

      class RuntimeContext < BaseModel
        # @!attribute [rw] runtime
        #   One of the constants defined in {Braintrust::Models::CodeBundle::RuntimeContext::Runtime}
        #   @return [Symbol]
        required :runtime, enum: -> { Braintrust::Models::CodeBundle::RuntimeContext::Runtime }

        # @!attribute [rw] version
        #   @return [String]
        required :version, String

        class Runtime < Braintrust::Enum
          NODE = :node
          PYTHON = :python
        end
      end
    end
  end
end
