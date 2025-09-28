# ServiceActor-Rails

ServiceActor-Rails provides Rails support for the
[ServiceActor](https://github.com/sunny/actor) gem.

## Installation

Add these lines to your application's Gemfile:

```ruby
# Composable service objects
gem "service_actor-rails"
```

## Usage

You can use the `actor` generator:

```sh
rails generate actor create_order
```

Creates `app/actors/create_order.rb`:

```ruby
class CreateOrder < Actor
  def call
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake` to run the tests and linting. You can also run `bin/console` for an
interactive prompt.

To release a new version, update the version number in `version.rb`, and in the
`CHANGELOG.md`, run `rake`, and create a commit for this version. You can then
run `rake release`, which will create a git tag for the version, push git
commits and tags, and push the gem to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome
[on GitHub](https://github.com/sunny/actor-rails).

This project is intended to be a safe, welcoming space for collaboration, and
everyone interacting in the project’s codebase and issue tracker is expected to
adhere to the [Contributor Covenant code of
conduct](https://github.com/sunny/actor-rails/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
