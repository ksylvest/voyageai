# frozen_string_literal: true

module VoyageAI
  # A configuration for VoyageAI.
  #
  # @example:
  #   VoyageAI.configure do |config|
  #     config.api_key = '...'
  #     config.host = 'https://api.voyageai.com'
  #     config.version = 'v1'
  #     config.logger = Logger.new(STDOUT)
  #     config.timeout = 15
  #   end
  class Config
    DEFAULT_HOST = "https://api.voyageai.com"
    DEFAULT_VERSION = "v1"

    # @!attribute [rw] api_key
    #   @return [String, nil]
    attr_accessor :api_key

    # @!attribute [rw] host
    #   @return [String, nil]
    attr_accessor :host

    # @!attribute [rw] version
    #   @return [String, nil]
    attr_accessor :version

    # @!attribute [rw] logger
    #   @return [Logger, nil]
    attr_accessor :logger

    # @!attribute [rw] timeout
    #   @return [Integer, nil]
    attr_accessor :timeout

    # @param api_key [String] optional - defaults to `ENV['VOYAGE_API_KEY']`
    # @param host [String] optional - defaults to `ENV['VOYAGEAI_HOST']`` w/ fallback to `https://api.voyageai.com`
    # @param version [String] optional - defaults to `ENV['DEFAULT_VERSION']` w/ fallback to `v1`
    # @param logger [Logger] optional
    # @param timeout [Integer] optional
    def initialize(
      api_key: ENV.fetch("VOYAGEAI_API_KEY", nil),
      host: ENV.fetch("VOYAGEAI_HOST", DEFAULT_HOST),
      version: ENV.fetch("VOYAGEAI_VERSION", DEFAULT_VERSION),
      logger: nil,
      timeout: nil
    )
      @api_key = api_key
      @host = host
      @version = version
      @logger = logger
      @timeout = timeout
    end
  end
end
