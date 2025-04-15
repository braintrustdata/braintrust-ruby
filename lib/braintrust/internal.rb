# frozen_string_literal: true

module Braintrust
  # @api private
  module Internal
    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{Braintrust::Internal}::OMIT>" }
      end
        .freeze
  end
end
