# VoyageAI

[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ksylvest/voyageai/blob/main/LICENSE)
[![RubyGems](https://img.shields.io/gem/v/voyageai)](https://rubygems.org/gems/voyageai)
[![GitHub](https://img.shields.io/badge/github-repo-blue.svg)](https://github.com/ksylvest/voyageai)
[![Yard](https://img.shields.io/badge/docs-site-blue.svg)](https://voyageai.ksylvest.com)
[![CircleCI](https://img.shields.io/circleci/build/github/ksylvest/voyageai)](https://circleci.com/gh/ksylvest/voyageai)

`voyageai` is a ruby client for [VoyageAI](https://www.voyageai.com)

## Installation

```bash
gem install voyageai
```

## Usage

### Embedding

#### Generating Single Embedding

```ruby
require 'voyageai'

input = 'A quick brown fox jumps over the lazy dog.'

voyageai = VoyageAI::Client.new(api_key: 'pa-...') # or configure ENV['VOYAGEAI_API_KEY']

embed = voyageai.embed(input)
embed.model # "..."
embed.usage # "#<VoyageAI::Usage total_tokens=...>"
embed.embedding # [0.0, ...]
```

#### Generating Multiple Embeddings

```ruby
require 'voyageai'

input = [
  'John is a musician.',
  'Paul is a plumber.',
  'George is a teacher.',
  'Ringo is a doctor.',
]

voyageai = VoyageAI::Client.new(api_key: 'pa-...') # or configure ENV['VOYAGEAI_API_KEY']

embed = voyageai.embed(input)
embed.model # "..."
embed.usage # "#<VoyageAI::Usage total_tokens=...>"
embed.embeddings # [[0.0, ...], ...]
```

### Reranking

```ruby
require 'voyageai'

query = 'Who is the best person to call for a toilet?'

documents = [
  'John is a musician.',
  'Paul is a plumber.',
  'George is a teacher.',
  'Ringo is a doctor.',
]

voyageai = VoyageAI::Client.new(api_key: 'pa-...') # or configure ENV['VOYAGEAI_API_KEY']

rerank = voyageai.rerank(query:, documents:, top_k: 3)
rerank.model # "..."
rerank.usage # "#<VoyageAI::Usage total_tokens=...>"
rerank.results # [#<VoyageAI::Reranking index=0 relevance_score=0.5>]
```

## Configuration

```ruby
require 'voyageai'

VoyageAI.configure do |config|
  config.api_key = 'pa-...' # defaults to ENV['VOYAGEAI_API_KEY']
  config.host = 'https://api.voyageai.com'
  config.version = 'v1'
  config.timeout = 15 # seconds
  config.logger = Logger.new(STDOUT)
end
```

## Examples

```ruby
require "voyageai"

Entry = Data.define(:document, :embedding)

VOYAGEAI = VoyageAI::Client.new

DOCUMENTS = [
  "John is a musician.",
  "Paul is a plumber.",
  "George is a teacher.",
  "Ringo is a doctor.",
  "Lisa is a lawyer.",
  "Stuart is a painter.",
  "Brian is a writer.",
  "Jane is a chef.",
  "Bill is a nurse.",
  "Susan is a carpenter.",
].freeze

embeddings = VOYAGEAI.embed(DOCUMENTS, input_type: "document").embeddings

ENTRIES = DOCUMENTS.zip(embeddings).map do |document, embedding|
  Entry.new(document:, embedding:)
end

# @param src [Array<Float>]
# @param dst [Array<Float>]
#
# @return [Float]
def euclidean_distance(src, dst)
  Math.sqrt(src.zip(dst).map { |a, b| (a - b)**2 }.reduce(:+))
end

# @param query [String]
# @param limit [Integer]
#
# @return [Array<String>]
def nearest_documents(query:, limit: 4)
  embedding = VOYAGEAI.embed(query, input_type: "query").embedding

  ENTRIES
    .sort_by { |entry| euclidean_distance(entry.embedding, embedding) }
    .first(limit)
    .map(&:document)
end

# @param query [String]
def search(query:)
  documents = nearest_documents(query:)

  results = VOYAGEAI.rerank(query:, documents:, top_k: 2).results

  puts "query=#{query.inspect}"
  results.each do |reranking|
    document = documents[reranking.index]
    puts("document=#{document.inspect} relevance_score=#{reranking.relevance_score}")
  end
end

search(query: "What do George and Ringo do?")
search(query: "Who works in the medical field?")
```

```
query="What do George and Ringo do?"
document="Ringo is a doctor." relevance_score=0.67968755
document="George is a teacher." relevance_score=0.58593755
```

```
query="Who works in the medical field?"
document="Bill is a nurse." relevance_score=0.55078125
document="Ringo is a doctor." relevance_score=0.50390625
```
