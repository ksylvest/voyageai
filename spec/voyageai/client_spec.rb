# frozen_string_literal: true

RSpec.describe VoyageAI::Client do
  describe "#inspect" do
    subject(:inspect) { client.inspect }

    let(:client) { build(:client) }

    it "returns a string" do
      expect(inspect).to eql '#<VoyageAI::Client api_key="fake_***" host="https://api.voyageai.com" version="v1">'
    end
  end

  describe "#embed" do
    subject(:embed) { client.embed(input, model:) }

    let(:client) { build(:client) }
    let(:model) { VoyageAI::Model::VOYAGE }
    let(:input) { ["Greetings!"] }

    context "when the request works" do
      before do
        stub_request(:post, "https://api.voyageai.com/v1/embeddings")
          .with(body: {
            model:,
            input:,
          })
          .to_return_json(status: 200, body: {
            object: "list",
            data: [
              {
                object: "embedding",
                embedding: [0.0, 1.0, 2.0, 3.0],
              },
            ],
            model:,
            usage: { "total_tokens" => 0 },
          })
      end

      it { is_expected.to be_a(VoyageAI::Embed) }
    end

    context "when the request fails" do
      before do
        stub_request(:post, "https://api.voyageai.com/v1/embeddings")
          .with(body: {
            model:,
            input:,
          })
          .to_return_json(status: 500, body: {
            error: "An unknown error occurred.",
          })
      end

      it { expect { embed }.to raise_error(VoyageAI::Client::RequestError) }
    end
  end

  describe "#rerank" do
    subject(:rerank) { client.rerank(query:, documents:, model:) }

    let(:client) { build(:client) }
    let(:model) { VoyageAI::Model::RERANK }
    let(:query) { "Welcome!" }
    let(:documents) { ["Greetings!"] }

    context "when the request works" do
      before do
        stub_request(:post, "https://api.voyageai.com/v1/rerank")
          .with(body: {
            model:,
            query:,
            documents:,
          })
          .to_return_json(status: 200, body: {
            object: "list",
            data: [
              {
                index: 0,
                relevance_score: 0.5,
              },
            ],
            model:,
            usage: { "total_tokens" => 0 },
          })
      end

      it { is_expected.to be_a(VoyageAI::Rerank) }
    end

    context "when the request fails" do
      before do
        stub_request(:post, "https://api.voyageai.com/v1/rerank")
          .with(body: {
            model:,
            query:,
            documents:,
          })
          .to_return_json(status: 500, body: {
            error: "An unknown error occurred.",
          })
      end

      it { expect { rerank }.to raise_error(VoyageAI::Client::RequestError) }
    end
  end
end
