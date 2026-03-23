# Braintrust Ruby API library

The Braintrust Ruby library provides convenient access to the Braintrust REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/braintrustdata/braintrust-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/braintrust).

The REST API documentation can be found on [www.braintrustdata.com](https://www.braintrustdata.com/docs/api/spec).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "braintrust", "~> 0.1.0.pre.alpha.6"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "braintrust"

braintrust = Braintrust::Client.new(
  api_key: ENV["BRAINTRUST_API_KEY"] # This is the default and can be omitted
)

project = braintrust.projects.create(name: "foobar")

puts(project.id)
```

### Pagination

List methods in the Braintrust API are paginated.

This library provides auto-paginating iterators with each list response, so you do not have to request successive pages manually:

```ruby
page = braintrust.projects.list

# Fetch single item from page.
project = page.objects[0]
puts(project.id)

# Automatically fetches more pages as needed.
page.auto_paging_each do |project|
  puts(project.id)
end
```

Alternatively, you can use the `#next_page?` and `#next_page` methods for more granular control working with pages.

```ruby
if page.next_page?
  new_page = page.next_page
  puts(new_page.objects[0].id)
end
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Braintrust::Errors::APIError` will be thrown:

```ruby
begin
  project = braintrust.projects.create(name: "foobar")
rescue Braintrust::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue Braintrust::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue Braintrust::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
braintrust = Braintrust::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
braintrust.projects.create(name: "foobar", request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
braintrust = Braintrust::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
braintrust.projects.create(name: "foobar", request_options: {timeout: 5})
```

On timeout, `Braintrust::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `Braintrust::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
project =
  braintrust.projects.create(
    name: "foobar",
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(project[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `Braintrust::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `Braintrust::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
braintrust.projects.create(name: "foobar")
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
braintrust.projects.create(name: "foobar")

# You can also splat a full Params class:
params = Braintrust::ProjectCreateParams.new(name: "foobar")
braintrust.projects.create(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :llm
puts(Braintrust::PromptCreateParams::FunctionType::LLM)

# Revealed type: `T.all(Braintrust::PromptCreateParams::FunctionType, Symbol)`
T.reveal_type(Braintrust::PromptCreateParams::FunctionType::LLM)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
braintrust.prompts.create(
  function_type: Braintrust::PromptCreateParams::FunctionType::LLM,
  # …
)

# Literal values are also permissible:
braintrust.prompts.create(
  function_type: :llm,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/braintrustdata/braintrust-ruby/tree/main/CONTRIBUTING.md).
