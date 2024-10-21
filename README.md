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

voyage_ai = VoyageAI::Client.new(api_key: 'pa-...')
result = voyage_ai.embed(input)
embed.model # "..."
embed.usage # "#<VoyageAI::Usage total_tokens=...>"
embed.embeddings.each do |embedding|
  embedding # "#<VoyageAI::Embedding index=... embedding=...>
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/voyageai.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
