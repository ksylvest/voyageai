# frozen_string_literal: true

RSpec.describe VoyageAI::Config do
  let(:config) { build(:config) }

  describe "#api_key" do
    subject(:api_key) { config.api_key }

    it { expect(api_key).to be_a(String) }
  end

  describe "#host" do
    subject(:host) { config.host }

    it { expect(host).to be_a(String) }
  end

  describe "#version" do
    subject(:version) { config.version }

    it { expect(version).to be_a(String) }
  end

  describe "#logger" do
    subject(:logger) { config.logger }

    it { expect(logger).to be_a(Logger) }
  end
end
