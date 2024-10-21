# frozen_string_literal: true

module VoyageAI
  # A client for interacting with the VoyageAI API.
  class Client
    BASE_URL = "https://api.voyageai.com/v1"

    # An error raised for any HTTP issues.
    class RequestError < StandardError
      attr_accessor :response

      # @param response [HTTP::Response]
      def initialize(response:)
        super("status=#{response.status} body=#{response.body}")
        @response = response
      end
    end

    # @param api_key [String] optional if ENV['VOYAGEAI_API_KEY'] otherwise required
    def initialize(api_key: ENV.fetch("VOYAGEAI_API_KEY", nil))
      @api_key = api_key || raise(ArgumentError, "api_key is required or ENV['VOYAGEAI_API_KEY'] must be present")
    end

    # @return [String]
    def inspect
      masked_api_key = "#{@api_key[..4]}***"

      "#<#{self.class.name} api_key=#{masked_api_key.inspect}>"
    end

    # @param model [String] optional (e.g. VoyageAI::Model::VOYAGE or "voyage-3")
    # @param input [String, Array<String>] required (e.g. "Sample" or ["Sample 1", "Sample 2", ...])
    #
    # @return [Embedding]
    def embed(input, model: Model::VOYAGE)
      payload = { input: arrayify(input), model: model }
      response = HTTP
        .accept(:json)
        .auth("Bearer #{@api_key}")
        .post("#{BASE_URL}/embeddings", json: payload)

      raise RequestError.new(response:) unless response.status.ok?

      Embed.parse(data: response.parse)
    end

    private

    def arrayify(input)
      input.is_a?(Array) ? input : [input]
    end
  end
end
