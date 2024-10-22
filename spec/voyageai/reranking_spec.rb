# frozen_string_literal: true

RSpec.describe VoyageAI::Reranking do
  describe ".parse" do
    subject(:parse) { described_class.parse(data: data) }

    let(:data) do
      { "index" => 0, document: "Sample", relevance_score: 0.0 }
    end

    it "parses a hash and returns an instance" do
      expect(parse).to be_a(described_class)
    end
  end

  describe "#inspect" do
    subject(:inspect) { reranking.inspect }

    let(:reranking) { build(:reranking) }

    it "returns a string" do
      expect(inspect).to eql("#<VoyageAI::Reranking index=0 relevance_score=0.0>")
    end
  end
end
