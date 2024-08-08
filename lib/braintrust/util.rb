# frozen_string_literal: true

module Braintrust
  # @!visibility private
  class Util
    # Use this to indicate that a value should be explicitly removed from a data structure
    # when using `Braintrust::Util.deep_merge`.
    # E.g. merging `{a: 1}` and `{a: OMIT}` should produce `{}`, where merging `{a: 1}` and
    # `{}` would produce `{a: 1}`.
    OMIT = Object.new.freeze

    # Recursively merge one hash with another.
    # If the values at a given key are not both hashes, just take the new value.
    # @param concat [true, false] whether to merge sequences by concatenation
    def self.deep_merge(left, right, concat: false)
      right_cleaned = if right.is_a?(Hash)
        right.reject { |_, value| value == OMIT }
      else
        right
      end

      if left.is_a?(Hash) && right_cleaned.is_a?(Hash)
        left
          .reject { |key, _| right[key] == OMIT }
          .merge(right_cleaned) do |_k, old_val, new_val|
            deep_merge(old_val, new_val, concat: concat)
          end
      elsif left.is_a?(Array) && right_cleaned.is_a?(Array) && concat
        left.concat(right_cleaned)
      else
        right_cleaned
      end
    end

    def self.coerce_integer(str)
      Integer(str)
    rescue StandardError
      str
    end

    def self.coerce_float(str)
      Float(str)
    rescue StandardError
      str
    end

    def self.coerce_boolean(input)
      case input
      when "true"
        true
      when "false"
        false
      else
        input
      end
    end
  end
end
