# frozen_string_literal: true

module VoyageAI
  # Used for logging via HTTP.
  class Instrumentation
    # @param logger [Logger]
    def initialize(logger:)
      @logger = logger
    end

    # @param name [String]
    # @param payload [Hash]
    #
    # @return [Object]
    def instrument(name, payload = {})
      start(name, payload)
      yield(payload) if block_given?
    ensure
      finish(name, payload)
    end

    # @example
    #   instrumenter.start("request.http", request: request)
    #
    # @param payload [Hash]
    # @option payload [HTTP::Request] :request
    def start(_, payload)
      request = payload[:request]
      return unless request

      @logger.info("#{request.verb.upcase} #{request.uri}")
    end

    # @example
    #    instrumenter.finish("request.http", response: response)
    #
    # @param payload [Hash]
    # @option payload [HTTP::Response] :response
    def finish(_, payload)
      response = payload[:response]
      return unless response

      @logger.info("#{response.status.code} #{response.status.reason}")
    end
  end
end
