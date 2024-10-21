# VoyageAI

`voyageai` is a ruby client for [VoyageAI](https://www.voyageai.com)

## Installation

```bash
gem install voyageai
```

## Usage

```ruby
require 'voyageai'

input = [
  'John is a musician.',
  'Paul is a plumber.',
  'George is a teacher.',
  'Ringo is a doctor.',
]

voyageai = VoyageAI::Client.new(api_key: 'pa-...') # or configure ENV['VOYAGEAI_API_KEY']

result = voyageai.embed(input)
embed.model # "..."
embed.usage # "#<VoyageAI::Usage total_tokens=...>"
embed.embeddings.each do |embedding|
  embedding.index # "#<VoyageAI::Embedding index=... embedding=...>
end
```
