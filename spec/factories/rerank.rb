# frozen_string_literal: true

FactoryBot.define do
  factory :rerank, class: "VoyageAI::Rerank" do
    initialize_with { new(model:, results:, usage:) }

    model { VoyageAI::Model::RERANK }
    results { [build(:reranking)] }
    usage
  end
end
