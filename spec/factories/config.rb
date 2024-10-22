# frozen_string_literal: true

FactoryBot.define do
  factory :config, class: "VoyageAI::Config" do
    initialize_with { new(api_key:, host:, version:, logger:) }

    api_key { "fake_api_key" }
    version { "v1" }
    host { "https://api.voyageai.com" }
    logger { Logger.new($stdout) }
  end
end
