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
            "embedding" => [0.0, 1.0, 2.0, 3.0],
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
  end

  describe "#inspect" do
    subject(:inspect) { embed.inspect }

    let(:embed) { build(:embed) }

    it "returns a string" do
      expect(inspect).to eql '#<VoyageAI::Embed model="voyage-3" embeddings=[] usage=#<VoyageAI::Usage total_tokens=0>>'
    end
  end
end
