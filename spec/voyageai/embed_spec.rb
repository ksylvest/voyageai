# frozen_string_literal: true

RSpec.describe VoyageAI::Embed do
  describe ".parse" do
    subject(:parse) { described_class.parse(data:) }

    let(:data) do
      {
        "object" => "list",
        "data" => [
          {
            "object" => "embedding",
            "embedding" => [0.0],
            "index" => 0,
          },
        ],
        "model" => "voyage-large-2",
        "usage" => { "total_tokens" => 0 },
      }
    end

    it "parses a hash and returns an instance" do
      expect(parse).to be_a(described_class)
    end

    it "sets embeddings to an array of arrays" do
      expect(parse.embeddings).to eql [[0.0]]
    end
  end

  describe "#inspect" do
    subject(:inspect) { embed.inspect }

    let(:embed) { build(:embed, embeddings: []) }

    it "returns a string" do
      expect(inspect).to eql(%(#<VoyageAI::Embed model="voyage-3.5" embeddings=[] usage=#{embed.usage.inspect}>))
    end
  end

  describe "#embedding" do
    subject(:embedding) { embed.embedding(index: index) }

    let(:embed) { build(:embed) }

    context "with an index that exists" do
      let(:index) { 0 }

      it "returns an array" do
        expect(embedding).to eql [0.0]
      end
    end

    context "when the index that does not exist" do
      let(:index) { 2 }

      it "returns nil" do
        expect(embedding).to be_nil
      end
    end
  end
end
