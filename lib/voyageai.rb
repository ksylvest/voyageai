# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "voyageai" => "VoyageAI"
loader.setup

module VoyageAI
  class Error < StandardError; end
end
