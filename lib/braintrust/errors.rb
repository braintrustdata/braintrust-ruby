# frozen_string_literal: true

module Braintrust
  class Error < StandardError
    # @!parse
    #   # @return [StandardError, nil]
    #   attr_reader :cause
  end

  class ConversionError < Braintrust::Error
  end

  class APIError < Braintrust::Error
    # @return [URI::Generic]
    attr_reader :url

    # @return [Integer, nil]
    attr_reader :status

    # @return [Object, nil]
    attr_reader :body

    # @private
    #
    # @param url [URI::Generic]
    # @param status [Integer, nil]
    # @param body [Object, nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    #
    def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
      @url = url
      @status = status
      @body = body
      @request = request
      @response = response
      super(message)
    end
  end

  class APIConnectionError < Braintrust::APIError
    # @!parse
    #   # @return [nil]
    #   attr_reader :status

    # @!parse
    #   # @return [nil]
    #   attr_reader :body

    # @private
    #
    # @param url [URI::Generic]
    # @param status [nil]
    # @param body [nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    #
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

  class APITimeoutError < Braintrust::APIConnectionError
    # @private
    #
    # @param url [URI::Generic]
    # @param status [nil]
    # @param body [nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    #
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

  class APIStatusError < Braintrust::APIError
    # @private
    #
    # @param url [URI::Generic]
    # @param status [Integer]
    # @param body [Object, nil]
    # @param request [nil]
    # @param response [nil]
    #
    # @return [Braintrust::APIStatusError]
    #
    def self.for(url:, status:, body:, request:, response:)
      kwargs = {url: url, status: status, body: body, request: request, response: response}

      case status
      in 400
        Braintrust::BadRequestError.new(**kwargs)
      in 401
        Braintrust::AuthenticationError.new(**kwargs)
      in 403
        Braintrust::PermissionDeniedError.new(**kwargs)
      in 404
        Braintrust::NotFoundError.new(**kwargs)
      in 409
        Braintrust::ConflictError.new(**kwargs)
      in 422
        Braintrust::UnprocessableEntityError.new(**kwargs)
      in 429
        Braintrust::RateLimitError.new(**kwargs)
      in (500..)
        Braintrust::InternalServerError.new(**kwargs)
      else
        Braintrust::APIStatusError.new(**kwargs)
      end
    end

    # @!parse
    #   # @return [Integer]
    #   attr_reader :status

    # @private
    #
    # @param url [URI::Generic]
    # @param status [Integer]
    # @param body [Object, nil]
    # @param request [nil]
    # @param response [nil]
    # @param message [String, nil]
    #
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

  class BadRequestError < Braintrust::APIStatusError
    HTTP_STATUS = 400
  end

  class AuthenticationError < Braintrust::APIStatusError
    HTTP_STATUS = 401
  end

  class PermissionDeniedError < Braintrust::APIStatusError
    HTTP_STATUS = 403
  end

  class NotFoundError < Braintrust::APIStatusError
    HTTP_STATUS = 404
  end

  class ConflictError < Braintrust::APIStatusError
    HTTP_STATUS = 409
  end

  class UnprocessableEntityError < Braintrust::APIStatusError
    HTTP_STATUS = 422
  end

  class RateLimitError < Braintrust::APIStatusError
    HTTP_STATUS = 429
  end

  class InternalServerError < Braintrust::APIStatusError
    HTTP_STATUS = (500..)
  end
end
