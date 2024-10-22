# frozen_string_literal: true

FactoryBot.define do
  factory :reranking, class: "VoyageAI::Reranking" do
    initialize_with { new(index:, document:, relevance_score:) }

    index { 0 }
    document { "Sample" }
    relevance_score { 0.0 }
  end
end
