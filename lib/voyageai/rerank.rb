# frozen_string_literal: true

module VoyageAI
  # The response for an rerank request that wraps the model / usage / results.
  #
  # @example
  #   VoyageAI::Rerank.new(model: "rerank-2", usage: VoyageAI::Usage.new(total_tokens: 0), results: [])
  class Rerank
    # @!attribute [rw] model
    #   @return [String]
    attr_accessor :model

    # @!attribute [rw] usage
    #   @return [Usage]
    attr_accessor :usage

    # @!attribute [rw] reranking
    #   @return [Array<Array<Float>>]
    attr_accessor :results

    # @param data [Hash]
    # @return [Embed]
    def self.parse(data:)
      model = data["model"]
      usage = Usage.parse(data: data["usage"])

      results = data["data"].map { |entry| Reranking.parse(data: entry) }

      new(model:, usage:, results:)
    end

    # @param model [String]
    # @param usage [Usage]
    # @param results [Array<Reranking>]
    def initialize(model:, usage:, results:)
      @model = model
      @usage = usage
      @results = results
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} model=#{@model.inspect} usage=#{@usage.inspect}>"
    end
  end
end
