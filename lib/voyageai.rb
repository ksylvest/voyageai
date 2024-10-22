# frozen_string_literal: true

require "http"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "voyageai" => "VoyageAI"
loader.setup

# The main entrypoint for VoyageAI.
module VoyageAI
  # @return [VoyageAI::Config]
  def self.config
    @config ||= Config.new
  end

  # @yield [VoyageAI::Config]
  def self.configure
    yield config
  end
end
