# frozen_string_literal: true

RSpec.describe VoyageAI::Rerank do
  describe ".parse" do
    subject(:parse) { described_class.parse(data: data) }

    let(:data) do
      {
        "object" => "list",
        "data" => [
          {
            "index" => 0,
            "document" => "Sample",
            "relevance_score" => 0.0,
          },
        ],
        "model" => "rerank-2",
        "usage" => { "total_tokens" => 0 },
      }
    end

    it "parses a hash and returns an instance" do
      expect(parse).to be_a(described_class)
    end
  end

  describe "#inspect" do
    subject(:inspect) { rerank.inspect }

    let(:rerank) { build(:rerank) }

    it "returns a string" do
      expect(inspect).to eql('#<VoyageAI::Rerank model="rerank-2" usage=#<VoyageAI::Usage total_tokens=0>>')
    end
  end
end
