# frozen_string_literal: true

RSpec.describe VoyageAI::Instrumentation do
  subject(:instrumentation) { described_class.new(logger:) }

  let(:logger) { instance_double(Logger) }

  let(:response) { instance_double(HTTP::Response, request:, status:) }
  let(:request) { instance_double(HTTP::Request, uri: "/embed", verb: "POST") }
  let(:status) { instance_double(HTTP::Response::Status, code: 200, reason: "OK") }

  describe "#instrument" do
    subject(:instrument) do
      allow(logger).to receive(:info)
      payload = {}
      payload[:request] = request
      instrumentation.instrument("request.http", payload) do
        payload[:response] = response
      end
    end

    it "calls start / yields / calls finish" do
      allow(logger).to receive(:info)
      instrument
      expect(logger).to have_received(:info).with("POST /embed")
      expect(logger).to have_received(:info).with("200 OK")
    end
  end

  describe "#start" do
    subject(:start) { instrumentation.start("start", request:) }

    it "logs the request" do
      allow(logger).to receive(:info)
      start
      expect(logger).to have_received(:info).with("POST /embed")
    end
  end

  describe "#finish" do
    subject(:finish) { instrumentation.finish("finish", response:) }

    it "logs the response" do
      allow(logger).to receive(:info)
      finish
      expect(logger).to have_received(:info).with("200 OK")
    end
  end
end
