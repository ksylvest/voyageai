# frozen_string_literal: true

FactoryBot.define do
  factory :usage, class: "VoyageAI::Usage" do
    initialize_with { new(total_tokens:) }

    total_tokens { 0 }
  end
end
