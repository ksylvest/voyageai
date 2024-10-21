# frozen_string_literal: true

RSpec.describe VoyageAI::Usage do
  describe ".parse" do
    subject(:parse) { described_class.parse(data: data) }

    let(:data) do
      { "total_tokens" => 0 }
    end

    it "parses a hash and returns an instance" do
      expect(parse).to be_a(described_class)
    end
  end

  describe "#inspect" do
    subject(:inspect) { usage.inspect }

    let(:usage) { build(:usage) }

    it "returns a string" do
      expect(inspect).to eql("#<VoyageAI::Usage total_tokens=0>")
    end
  end
end
