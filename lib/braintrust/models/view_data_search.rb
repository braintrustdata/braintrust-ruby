# frozen_string_literal: true

module Braintrust
  module Models
    class ViewDataSearch < Braintrust::Internal::Type::BaseModel
      # @!attribute filter
      #
      #   @return [Array<Object, nil>, nil]
      optional :filter,
               Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute match
      #
      #   @return [Array<Object, nil>, nil]
      optional :match,
               Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute sort
      #
      #   @return [Array<Object, nil>, nil]
      optional :sort,
               Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute tag
      #
      #   @return [Array<Object, nil>, nil]
      optional :tag,
               Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!method initialize(filter: nil, match: nil, sort: nil, tag: nil)
      #   @param filter [Array<Object, nil>, nil]
      #   @param match [Array<Object, nil>, nil]
      #   @param sort [Array<Object, nil>, nil]
      #   @param tag [Array<Object, nil>, nil]
    end
  end
end
