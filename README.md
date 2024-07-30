# Braintrust Ruby API library

The Braintrust Ruby library provides convenient access to the Braintrust REST API from any Ruby 3.0+
application.

It is generated with [Stainless](https://www.stainlessapi.com/).

## Documentation

Documentation for the most recent version of this gem can be found [on RubyDoc](https://rubydoc.info/github/braintrustdata/braintrust-ruby).

The underlying REST API documentation can be found on [www.braintrustdata.com](https://www.braintrustdata.com/docs/api/spec).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by
adding the following to your application's `Gemfile`:

```ruby
gem "braintrust", git: "https://github.com/braintrustdata/braintrust-ruby", branch: "main"
```

To fetch an initial copy of the gem:

```sh
bundle install
```

To update the version used by your application when updates are pushed to
GitHub:

```sh
bundle update braintrust
```

## Usage

```ruby
require "braintrust"

braintrust = Braintrust::Client.new

project = braintrust.projects.create(name: "foobar")

puts project.id
```

### Errors

When the library is unable to connect to the API, or if the API returns a
non-success status code (i.e., 4xx or 5xx response), a subclass of
`Braintrust::HTTP::Error` will be thrown:

```ruby
begin
  project = braintrust.projects.create(name: "foobar")
rescue Braintrust::HTTP::Error => e
  puts e.code # 400
end
```

Error codes are as followed:

| Status Code | Error Type                 |
| ----------- | -------------------------- |
| 400         | `BadRequestError`          |
| 401         | `AuthenticationError`      |
| 403         | `PermissionDeniedError`    |
| 404         | `NotFoundError`            |
| 409         | `ConflictError`            |
| 422         | `UnprocessableEntityError` |
| 429         | `RateLimitError`           |
| >=500       | `InternalServerError`      |
| (else)      | `APIStatusError`           |
| N/A         | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short
exponential backoff. Connection errors (for example, due to a network
connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit,
and >=500 Internal errors will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
braintrust = Braintrust::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
braintrust.projects.create(name: "foobar", max_retries: 5)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the
library is in initial development and has a major version of `0`, APIs may change
at any time.

## Requirements

Ruby 3.0 or higher.
