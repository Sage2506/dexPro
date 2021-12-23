# DexPro

This is a wrapper of the Pokemon Api V2 Pokeapi. It contains al the main requests such as fetch all pokemons, one by one, fetch Berries, Contests, Encounters, Evolution, Games, Items, Locations, Machines and moves

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dexPro'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dexPro

## Usage

TODO: Write usage instructions here

After you install the gem you have access to all the categories classes.

Get all the Pokémon will return all available pokémon on the Api returning them on an Array with each item contain it name and a link to the single item info:

```ruby
DexPro::Pokemon.new().all
```

list a section of the full catalog of pokemon, it can receive a page and a limit to specify page and number of items on each list, each item containing its name and a link to the item full info

```ruby
DexPro::Pokemon.new().list(1, 20)
```

find a pokemon by its id or name, this method return a hash containing all the info available in the api about the id or name you search

```ruby
DexPro::Pokemon.new().find()
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dexPro.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
