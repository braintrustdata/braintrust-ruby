# frozen_string_literal: true

module Braintrust
  module Models
    class UserListParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute [r] email
      #   Email of the user to search for. You may pass the param multiple times to filter
      #     for more than one email
      #
      #   @return [String, Array<String>, nil]
      optional :email, union: -> { Braintrust::Models::UserListParams::Email }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :email

      # @!attribute [r] ending_before
      #   Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :ending_before, String

      # @!parse
      #   # @return [String]
      #   attr_writer :ending_before

      # @!attribute [r] family_name
      #   Family name of the user to search for. You may pass the param multiple times to
      #     filter for more than one family name
      #
      #   @return [String, Array<String>, nil]
      optional :family_name, union: -> { Braintrust::Models::UserListParams::FamilyName }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :family_name

      # @!attribute [r] given_name
      #   Given name of the user to search for. You may pass the param multiple times to
      #     filter for more than one given name
      #
      #   @return [String, Array<String>, nil]
      optional :given_name, union: -> { Braintrust::Models::UserListParams::GivenName }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :given_name

      # @!attribute [r] ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::UserListParams::IDs }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :ids

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute [r] org_name
      #   Filter search results to within a particular organization
      #
      #   @return [String, nil]
      optional :org_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :org_name

      # @!attribute [r] starting_after
      #   Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :starting_after, String

      # @!parse
      #   # @return [String]
      #   attr_writer :starting_after

      # @!parse
      #   # @param email [String, Array<String>]
      #   # @param ending_before [String]
      #   # @param family_name [String, Array<String>]
      #   # @param given_name [String, Array<String>]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param org_name [String]
      #   # @param starting_after [String]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     email: nil,
      #     ending_before: nil,
      #     family_name: nil,
      #     given_name: nil,
      #     ids: nil,
      #     limit: nil,
      #     org_name: nil,
      #     starting_after: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # Email of the user to search for. You may pass the param multiple times to filter
      #   for more than one email
      #
      # @example
      # ```ruby
      # case email
      # in String
      #   # ...
      # in Braintrust::Models::UserListParams::Email::StringArray
      #   # ...
      # end
      # ```
      class Email < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::UserListParams::Email::StringArray
      end

      # @abstract
      #
      # Family name of the user to search for. You may pass the param multiple times to
      #   filter for more than one family name
      #
      # @example
      # ```ruby
      # case family_name
      # in String
      #   # ...
      # in Braintrust::Models::UserListParams::FamilyName::StringArray
      #   # ...
      # end
      # ```
      class FamilyName < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::UserListParams::FamilyName::StringArray
      end

      # @abstract
      #
      # Given name of the user to search for. You may pass the param multiple times to
      #   filter for more than one given name
      #
      # @example
      # ```ruby
      # case given_name
      # in String
      #   # ...
      # in Braintrust::Models::UserListParams::GivenName::StringArray
      #   # ...
      # end
      # ```
      class GivenName < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::UserListParams::GivenName::StringArray
      end

      # @abstract
      #
      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      # @example
      # ```ruby
      # case ids
      # in String
      #   # ...
      # in Braintrust::Models::UserListParams::IDs::StringArray
      #   # ...
      # end
      # ```
      class IDs < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::UserListParams::IDs::StringArray
      end
    end
  end
end
