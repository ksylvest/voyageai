# frozen_string_literal: true

RSpec.describe VoyageAI::Embedding do
  describe ".parse" do
    subject(:parse) { described_class.parse(data: data) }

    let(:data) do
      {
        "embedding" => [],
        "index" => 0,
      }
    end

    it "parses a hash and returns an instance" do
      expect(parse).to be_a(described_class)
    end
  end

  describe "#inspect" do
    subject(:inspect) { embedding.inspect }

    let(:embedding) { build(:embedding) }

    it "returns a string" do
      expect(inspect).to eql "#<VoyageAI::Embedding index=0 embedding=[]>"
    end
  end
end
