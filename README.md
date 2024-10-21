# VoyageAI

`voyageai` is a ruby client for [VoyageAI](https://www.voyageai.com)

## Installation

```bash
gem install voyageai
```

## Usage

### Generating Single Embedding

```ruby
require 'voyageai'

input = 'A quick brown fox jumps over the lazy dog.'

voyageai = VoyageAI::Client.new(api_key: 'pa-...') # or configure ENV['VOYAGEAI_API_KEY']

embed = voyageai.emed(input)
embed.model # "..."
embed.usage # "#<VoyageAI::Usage total_tokens=...>"
embed.embedding # [0.0, ...]
```

### Generating Multiple Embeddings

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
