# frozen_string_literal: true

module VoyageAI
  # An embedding returned by the VoyageAI API.
  #
  # @example
  #   VoyageAI::Embedding.new(index: 0, embedding: [0.0, 1.0, 2.0, 3.0])
  class Embedding
    # @!attribute [rw] model
    #   @return [Integer]
    attr_accessor :index

    # @!attribute [rw] embedding
    #   @return [Array<Float>]
    attr_accessor :embedding

    # @param data [Hash]
    # @return [Embedding]
    def self.parse(data:)
      index = data["index"]
      embedding = data["embedding"]
      new(index:, embedding:)
    end

    # @param index [Integer]
    # @param embedding [Array<Float>]
    def initialize(index:, embedding:)
      @index = index
      @embedding = embedding
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} index=#{index} embedding=#{embedding.inspect}>"
    end
  end
end
