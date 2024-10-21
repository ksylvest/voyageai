# frozen_string_literal: true

require "voyageai"
require "simplecov"
require "webmock/rspec"

SimpleCov.start

Dir["#{__dir__}/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
