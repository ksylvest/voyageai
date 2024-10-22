# VoyageAI

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

embed = voyageai.emed(input)
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
