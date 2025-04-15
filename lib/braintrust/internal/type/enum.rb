# frozen_string_literal: true

module Braintrust
  module Internal
    module Type
      # @api private
      #
      # A value from among a specified list of options. OpenAPI enum values map to Ruby
      # values in the SDK as follows:
      #
      # 1. boolean => true | false
      # 2. integer => Integer
      # 3. float => Float
      # 4. string => Symbol
      #
      # We can therefore convert string values to Symbols, but can't convert other
      # values safely.
      #
      # @example
      #   # `acl_object_type` is a `Braintrust::Models::ACLObjectType`
      #   case acl_object_type
      #   when Braintrust::Models::ACLObjectType::ORGANIZATION
      #     # ...
      #   when Braintrust::Models::ACLObjectType::PROJECT
      #     # ...
      #   when Braintrust::Models::ACLObjectType::EXPERIMENT
      #     # ...
      #   else
      #     puts(acl_object_type)
      #   end
      #
      # @example
      #   case acl_object_type
      #   in :organization
      #     # ...
      #   in :project
      #     # ...
      #   in :experiment
      #     # ...
      #   else
      #     puts(acl_object_type)
      #   end
      module Enum
        include Braintrust::Internal::Type::Converter

        # All of the valid Symbol values for this enum.
        #
        # @return [Array<NilClass, Boolean, Integer, Float, Symbol>]
        def values = (@values ||= constants.map { const_get(_1) })

        # @api private
        #
        # Guard against thread safety issues by instantiating `@values`.
        private def finalize! = values

        # @param other [Object]
        #
        # @return [Boolean]
        def ===(other) = values.include?(other)

        # @param other [Object]
        #
        # @return [Boolean]
        def ==(other)
          # rubocop:disable Layout/LineLength
          other.is_a?(Module) && other.singleton_class <= Braintrust::Internal::Type::Enum && other.values.to_set == values.to_set
          # rubocop:enable Layout/LineLength
        end

        # @api private
        #
        # Unlike with primitives, `Enum` additionally validates that the value is a member
        # of the enum.
        #
        # @param value [String, Symbol, Object]
        #
        # @param state [Hash{Symbol=>Object}] .
        #
        #   @option state [Boolean, :strong] :strictness
        #
        #   @option state [Hash{Symbol=>Object}] :exactness
        #
        #   @option state [Integer] :branched
        #
        # @return [Symbol, Object]
        def coerce(value, state:)
          exactness = state.fetch(:exactness)
          val = value.is_a?(String) ? value.to_sym : value

          if values.include?(val)
            exactness[:yes] += 1
            val
          else
            exactness[values.first&.class == val.class ? :maybe : :no] += 1
            value
          end
        end

        # @!parse
        #   # @api private
        #   #
        #   # @param value [Symbol, Object]
        #   #
        #   # @param state [Hash{Symbol=>Object}] .
        #   #
        #   #   @option state [Boolean] :can_retry
        #   #
        #   # @return [Symbol, Object]
        #   def dump(value, state:) = super

        # @api private
        #
        # @param depth [Integer]
        #
        # @return [String]
        def inspect(depth: 0)
          return super() if depth.positive?

          members = values.map { Braintrust::Internal::Type::Converter.inspect(_1, depth: depth.succ) }

          "#{name}[#{members.join(' | ')}]"
        end
      end
    end
  end
end
