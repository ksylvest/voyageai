# frozen_string_literal: true

FactoryBot.define do
  factory :embedding, class: "VoyageAI::Embedding" do
    initialize_with { new(index:, embedding:) }

    index { 0 }
    embedding { [] }
  end
end
