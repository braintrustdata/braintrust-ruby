# frozen_string_literal: true

module Braintrust
  module Errors
    class Error < StandardError
      # @!attribute cause
      #
      #   @return [StandardError, nil]
    end

    class ConversionError < Braintrust::Errors::Error
    end

    class APIError < Braintrust::Errors::Error
      # @return [URI::Generic]
      attr_accessor :url

      # @return [Integer, nil]
      attr_accessor :status

      # @return [Object, nil]
      attr_accessor :body

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
        @url = url
        @status = status
        @body = body
        @request = request
        @response = response
        super(message)
      end
    end

    class APIConnectionError < Braintrust::Errors::APIError
      # @!attribute status
      #
      #   @return [nil]

      # @!attribute body
      #
      #   @return [nil]

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
        super
      end
    end

    class APITimeoutError < Braintrust::Errors::APIConnectionError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
        super
      end
    end

    class APIStatusError < Braintrust::Errors::APIError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      #
      # @return [self]
      def self.for(url:, status:, body:, request:, response:, message: nil)
        kwargs = {
          url: url,
          status: status,
          body: body,
          request: request,
          response: response,
          message: message
        }

        case status
        in 400
          Braintrust::Errors::BadRequestError.new(**kwargs)
        in 401
          Braintrust::Errors::AuthenticationError.new(**kwargs)
        in 403
          Braintrust::Errors::PermissionDeniedError.new(**kwargs)
        in 404
          Braintrust::Errors::NotFoundError.new(**kwargs)
        in 409
          Braintrust::Errors::ConflictError.new(**kwargs)
        in 422
          Braintrust::Errors::UnprocessableEntityError.new(**kwargs)
        in 429
          Braintrust::Errors::RateLimitError.new(**kwargs)
        in (500..)
          Braintrust::Errors::InternalServerError.new(**kwargs)
        else
          Braintrust::Errors::APIStatusError.new(**kwargs)
        end
      end

      # @!parse
      #   # @return [Integer]
      #   attr_accessor :status

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status:, body:, request:, response:, message: nil)
        message ||= {url: url.to_s, status: status, body: body}
        super(
          url: url,
          status: status,
          body: body,
          request: request,
          response: response,
          message: message&.to_s
        )
      end
    end

    class BadRequestError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 400
    end

    class AuthenticationError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 401
    end

    class PermissionDeniedError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 403
    end

    class NotFoundError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 404
    end

    class ConflictError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 409
    end

    class UnprocessableEntityError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 422
    end

    class RateLimitError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = 429
    end

    class InternalServerError < Braintrust::Errors::APIStatusError
      HTTP_STATUS = (500..)
    end
  end
end
