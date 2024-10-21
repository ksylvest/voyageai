# frozen_string_literal: true

module VoyageAI
  # The response for an embeddings request that wraps the model / usage / embeddings.
  #
  # @example
  #   VoyageAI::Embed.new(model: "voyage-3", usage: VoyageAI::Usage.new(total_tokens: 0), embeddings: [])
  class Embed
    # @!attribute [rw] model
    #   @return [String]
    attr_accessor :model

    # @!attribute [rw] usage
    #   @return [Usage]
    attr_accessor :usage

    # @!attribute [rw] embeddings
    #   @return [Array<Embedding>]
    attr_accessor :embeddings

    # @param data [Hash]
    # @return [Embed]
    def self.parse(data:)
      model = data["model"]
      usage = Usage.parse(data: data["usage"])
      embeddings = data["data"].map do |embedding_data|
        Embedding.parse(data: embedding_data)
      end

      Embed.new(model: model, usage: usage, embeddings: embeddings)
    end

    # @param model [String]
    # @param usage [Usage]
    # @param embeddings [Array<Embedding>]
    def initialize(model:, usage:, embeddings:)
      @model = model
      @usage = usage
      @embeddings = embeddings
    end

    # @return [String]
    def inspect
      "#<#{self.class.name} model=#{@model.inspect} embeddings=#{@embeddings.inspect} usage=#{@usage.inspect}>"
    end
  end
end
