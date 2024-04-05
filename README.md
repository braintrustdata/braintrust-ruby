# Braintrust Ruby API library

The Braintrust Ruby library provides convenient access to the Braintrust REST API from any Ruby 3.0+
application.

It is generated with [Stainless](https://www.stainlessapi.com/).

## Documentation

Documentation for the most recent version of this gem can be found [on RubyDoc](https://rubydoc.info/github/stainless-sdks/manugoyal/braintrust-sdk-kotlin-ruby).

The underlying REST API documentation can be found [on www.braintrustdata.com](https://www.braintrustdata.com/docs/api/spec).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by
adding the following to your application's `Gemfile`:

```ruby
gem "braintrust", git: "https://github.com/stainless-sdks/manugoyal/braintrust-sdk-kotlin-ruby", branch: "main"
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

braintrust = Braintrust::Client.new(
)

project = braintrust.project.create();

puts project.id
```

### Resources

Functionality in this library is organized around the resources exposed by the
Braintrust API. Methods on those resources correspond to endpoints on the API,
e.g.:

```ruby
card = braintrust.cards.create({
  account_id: "account_in71c4a4ph0vgo2ql3ky",
  description: "Card for Alice"
})
```

Methods that reference an object will take an identifier for that object as
the first argument:

```ruby
card = braintrust.cards.retrieve("card_ou2s0hwk5rn6kn2e7xg2")
```

When data beyond an identifier is needed for a request, such as with create or
update, pass a Hash with Symbol keys:

```ruby
updated_card = braintrust.cards.update(
  "card_ou2s0hwk5rn6kn2e7xg2",
  {description: "New description"}
)
```

All methods take request options as their last argument. These can be used to
modify the behaviour of the client for that particular request. This argument
can always be omitted if not needed. See the `Braintrust::RequestOptions`
docs for details:

```ruby
card = braintrust.cards.update(
  "card_ou2s0hwk5rn6kn2e7xg2",
  {description: "New description"},
  {max_retires: 1}
)
```

Detailed documentation for all resources can be found in the `Braintrust::Resources`
namespace.

### Models

The library provides Ruby classes for all responses returned by the API.
Instances of these classes allow convenient access to parsed response data:

```ruby
card = braintrust.cards.create({
  account_id: "account_in71c4a4ph0vgo2ql3ky",
  description: "Card for Bob"
})
card.expiration_year
#=> 2028
```

You can also access model attribute data using key lookup syntax:

```ruby
card[:expiration_year]
#=> 2028
```

To get all parsed data as a Hash, use `to_h`:

```ruby
card_data = card.to_h
card_data.keys
#=> [:id, :account_id, :created_at, :description, ...]
```

See the `Braintrust::Models` docs for details.

### Errors

When the library is unable to connect to the API, or if the API returns a
non-success status code (i.e., 4xx or 5xx response), a subclass of
`Braintrust::HTTP::Error` will be thrown:

```ruby
begin
  project = braintrust.project.create()
rescue Braintrust::HTTP::Error => err
  puts err.code # 400
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
max_retries: 0, # default is 2
)

# Or, configure per-request:
braintrust.project.create(max_retries: 5);
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the
library is in initial development and has a major version of `0`, APIs may change
at any time.

## Requirements

Ruby 3.0 or higher.
