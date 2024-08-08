# frozen_string_literal: true

require_relative "lib/braintrust/version"

Gem::Specification.new do |s|
  s.name = "braintrust"
  s.version = Braintrust::VERSION
  s.summary = "Ruby library to access the Braintrust API"
  s.authors = ["Braintrust"]
  s.email = "info@braintrustdata.com"
  s.files = Dir["lib/**/*.rb"]
  s.extra_rdoc_files = ["README.md"]
  s.required_ruby_version = ">= 3.0.0"
  s.add_dependency "connection_pool"
  s.homepage = "https://rubydoc.info/github/braintrustdata/braintrust-ruby"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/braintrustdata/braintrust-ruby"
  s.metadata["rubygems_mfa_required"] = "true"
end
