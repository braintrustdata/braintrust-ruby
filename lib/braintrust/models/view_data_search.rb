# frozen_string_literal: true

module Braintrust
  module Models
    class ViewDataSearch < Braintrust::BaseModel
      # @!attribute filter
      #
      #   @return [Array<Object, nil>, nil]
      optional :filter, Braintrust::ArrayOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute match
      #
      #   @return [Array<Object, nil>, nil]
      optional :match, Braintrust::ArrayOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute sort
      #
      #   @return [Array<Object, nil>, nil]
      optional :sort, Braintrust::ArrayOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute tag
      #
      #   @return [Array<Object, nil>, nil]
      optional :tag, Braintrust::ArrayOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!parse
      #   # @param filter [Array<Object, nil>, nil]
      #   # @param match [Array<Object, nil>, nil]
      #   # @param sort [Array<Object, nil>, nil]
      #   # @param tag [Array<Object, nil>, nil]
      #   #
      #   def initialize(filter: nil, match: nil, sort: nil, tag: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
