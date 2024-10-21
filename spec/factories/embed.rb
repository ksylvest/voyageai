# frozen_string_literal: true

FactoryBot.define do
  factory :embed, class: "VoyageAI::Embed" do
    initialize_with { new(model:, embeddings:, usage:) }

    model { VoyageAI::Model::VOYAGE }
    usage
    embeddings { [[0.0]] }
  end
end
