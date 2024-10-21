# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: "VoyageAI::Client" do
    initialize_with { new(api_key:) }

    api_key { "fake_api_key" }
  end
end
