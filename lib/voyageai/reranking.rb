# frozen_string_literal: true

module VoyageAI
  # The response of an individual re-ranking.
  #
  # @example
  #   VoyageAI::Reranking.new(index: 0, document: "Sample", relevance_score: 0.0)
  class Reranking
    # @!attribute [rw] model
    #   @return [Integer]
    attr_accessor :index

    # @!attribute [rw] document
    #   @return [String]
    attr_accessor :document

    # @!attribute [rw] relevance_score
    #   @return [Float]
    attr_accessor :relevance_score

    # @param index [Integer]
    # @param document [String]
    # @param relevance_score [Float]
    def initialize(index:, document:, relevance_score:)
      @index = index
      @document = document
      @relevance_score = relevance_score
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} index=#{@index} relevance_score=#{@relevance_score}>"
    end

    # @param data [Hash]
    #
    # @return [Reranking]
    def self.parse(data:)
      index = data["index"]
      document = data["document"]
      relevance_score = data["relevance_score"]

      new(index: index, document: document, relevance_score: relevance_score)
    end
  end
end
