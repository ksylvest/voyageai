# frozen_string_literal: true

require_relative "lib/voyageai/version"

Gem::Specification.new do |spec|
  spec.name = "voyageai"
  spec.version = VoyageAI::VERSION
  spec.authors = ["Kevin Sylvestre"]
  spec.email = ["kevin@ksylvest.com"]

  spec.summary = "A client for voyageai.com."
  spec.description = "A library for generating embeddings with https://voyageai.com."
  spec.homepage = "https://github.com/ksylvest/voyageai."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.glob("{bin,lib,exe}/**/*") + %w[README.md Gemfile]
  spec.require_paths = ["lib"]

  spec.add_dependency "http"
  spec.add_dependency "zeitwerk"
end
