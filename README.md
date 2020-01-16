# SmartOptions

SmartOptions allows you to define options classes which have default and required options

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smart_options'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_options

## Usage

Inherit from SmartOptions class to get all functionality:

```ruby
class UserOptions < SmartOptions
    option :first_name, required: true
    option :last_name, required: true
    option :admin, defaut: false
end
```

User created options class:

```ruby
options = UserOptions.new(first_name: "Foo", last_name: "Bar")

options.first_name # => "Foo"
options.last_name # => "Bar"
options.admin # => false

options.middle_name # => raises exception listing wrong options
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/smart_options.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
