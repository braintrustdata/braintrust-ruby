# frozen_string_literal: true

module Braintrust
  module Models
    class CodeBundle < BaseModel
      # @!attribute [rw] bundle_id
      #   @return [String]
      required :bundle_id, String

      # @!attribute [rw] location
      #   @return [Braintrust::Models::CodeBundle::Location::UnnamedTypeWithunionParent0, Braintrust::Models::CodeBundle::Location::UnnamedTypeWithunionParent1]
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
        #   @return [Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime]
        required :runtime, enum: -> { Braintrust::Models::CodeBundle::RuntimeContext::Runtime }

        # @!attribute [rw] version
        #   @return [String]
        required :version, String

        class Runtime < Braintrust::Enum
          NODE = :node
          PYTHON = :python
        end

        # @!parse
        #   # Create a new instance of RuntimeContext from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :runtime
        #   #   @option data [String] :version
        #   def initialize(data = {}) = super
      end

      # @!parse
      #   # Create a new instance of CodeBundle from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :bundle_id
      #   #   @option data [Object] :location
      #   #   @option data [Object] :runtime_context
      #   #   @option data [String, nil] :preview A preview of the code
      #   def initialize(data = {}) = super
    end
  end
end
