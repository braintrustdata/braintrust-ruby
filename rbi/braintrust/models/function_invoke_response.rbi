# typed: strong

module Braintrust
  module Models
    FunctionInvokeResponse = T.let(T.anything, Braintrust::Internal::Type::Converter)
  end
end
