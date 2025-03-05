# typed: strong

module Braintrust
  class Error < StandardError
    sig { returns(T.nilable(StandardError)) }
    def cause
    end
  end

  class ConversionError < Braintrust::Error
  end

  class APIError < Braintrust::Error
    sig { returns(URI::Generic) }
    def url
    end

    sig { returns(T.nilable(Integer)) }
    def status
    end

    sig { returns(T.nilable(T.anything)) }
    def body
    end

    sig do
      params(
        url: URI::Generic,
        status: T.nilable(Integer),
        body: T.nilable(Object),
        request: NilClass,
        response: NilClass,
        message: T.nilable(String)
      )
        .void
    end
    def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: nil)
    end
  end

  class APIConnectionError < Braintrust::APIError
    sig { void }
    def status
    end

    sig { void }
    def body
    end

    sig do
      params(
        url: URI::Generic,
        status: NilClass,
        body: NilClass,
        request: NilClass,
        response: NilClass,
        message: T.nilable(String)
      )
        .void
    end
    def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: "Connection error.")
    end
  end

  class APITimeoutError < Braintrust::APIConnectionError
    sig do
      params(
        url: URI::Generic,
        status: NilClass,
        body: NilClass,
        request: NilClass,
        response: NilClass,
        message: T.nilable(String)
      )
        .void
    end
    def initialize(url:, status: nil, body: nil, request: nil, response: nil, message: "Request timed out.")
    end
  end

  class APIStatusError < Braintrust::APIError
    sig do
      params(
        url: URI::Generic,
        status: Integer,
        body: T.nilable(Object),
        request: NilClass,
        response: NilClass
      )
        .returns(T.attached_class)
    end
    def self.for(url:, status:, body:, request:, response:)
    end

    sig { returns(Integer) }
    def status
    end

    sig do
      params(
        url: URI::Generic,
        status: Integer,
        body: T.nilable(Object),
        request: NilClass,
        response: NilClass,
        message: T.nilable(String)
      )
        .void
    end
    def initialize(url:, status:, body:, request:, response:, message: nil)
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
    HTTP_STATUS = T.let((500..), T::Range[Integer])
  end
end
